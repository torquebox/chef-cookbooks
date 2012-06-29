deployments = "/opt/torquebox-current/jboss/standalone/deployments"

def initialize(*args)
  super
  @action ||= :deploy
end

action :deploy do
  execute "torquebox deploy #{new_resource.path}" do
    creates "#{deployments}/#{new_resource.name}-knob.yml.deployed"
  end
end

action :undeploy do
  execute "torquebox undeploy #{new_resource.path}" do
    creates "#{deployments}/#{new_resource.name}-knob.yml.undeployed"
  end
end
