include_recipe 'apache2'
include_recipe 'silverware'

version = node[:mod_cluster][:version]
prefix = "/opt/mod_cluster-#{version}"
current = node[:mod_cluster][:mod_cluster_dir]

directory prefix do
  owner "root"
  group "root"
  recursive true
  action    :create
end

remote_file "#{prefix}/mod_cluster-#{version}.tar.gz" do
  source      node[:mod_cluster][:url]
  mode        "0644"
  action      :create
  not_if{     ::File.exists?("#{prefix}/mod_cluster-#{version}.tar.gz") }
end

bash "unpack mod_cluster-#{version} release" do
  user    "root"
  cwd     prefix
  code    "tar xzf mod_cluster-#{version}.tar.gz"
  creates "#{prefix}/mod_slotmem.so"
end

link current do
  to prefix
end

# Allow bind_ip entries like ["cloud", "local_ipv4"]
if node[:mod_cluster][:mcpm_bind_ip].is_a?(Array)
  node.set[:mod_cluster][:mcpm_bind_ip_resolved] = node[:mod_cluster][:mcpm_bind_ip].inject(node) do |hash, key|
    hash[key]
  end
else
  node.set[:mod_cluster][:mcpm_bind_ip_resolved] = node[:mod_cluster][:mcpm_bind_ip]
end

[ "slotmem", "proxy_cluster", "manager"].each do |mod|
  file "#{node[:apache][:dir]}/mods-available/#{mod}.load" do
    content "LoadModule #{mod}_module #{current}/mod_#{mod}.so\n"
    mode 0644
  end
end

apache_module "proxy"
apache_module "proxy_ajp"
apache_module "proxy_cluster"
apache_module "slotmem"
apache_module "manager" do
  conf true
end

announce(:mod_cluster, :server)
