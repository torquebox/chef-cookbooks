actions :deploy, :undeploy

attribute :path, :kind_of => String, :required => true
attribute :env, :kind_of => String, :default => 'development'