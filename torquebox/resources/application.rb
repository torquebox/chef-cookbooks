actions :deploy, :undeploy

attribute :path, :kind_of => String, :required => true
attribute :environment, :kind_of => String, :default => 'development'