deployments = "/opt/torquebox-current/jboss/standalone/deployments"

def initialize(*args)
  super
  @action ||= :deploy
end

action :deploy do
  execute "torquebox deploy" do
    command "torquebox deploy #{new_resource.path} --name=#{new_resource.name} --env=#{new_resource.env}"
    creates "#{deployments}/#{new_resource.name}-knob.yml.deployed"
  end
end

action :undeploy do
  execute "torquebox undeploy" do
    command "torquebox undeploy #{new_resource.path} --name=#{new_resource.name}"
    creates "#{deployments}/#{new_resource.name}-knob.yml.undeployed"
  end
end
