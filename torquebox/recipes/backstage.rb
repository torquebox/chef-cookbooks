package 'git-core'

directory "/var/www/" do
  recursive true
end

git "/var/www/backstage" do
  repository node[:torquebox][:backstage_gitrepo]
  revision "HEAD"
  destination node[:torquebox][:backstage_home]
  action :sync
end

execute "bundle install" do
  command "jruby -S bundle install"
  cwd node[:torquebox][:backstage_home]
  not_if "jruby -S bundle check"
end

torquebox_application "backstage" do
  action :deploy
  path node[:torquebox][:backstage_home]
end
