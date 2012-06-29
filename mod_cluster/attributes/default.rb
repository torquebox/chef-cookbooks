default[:mod_cluster][:version] = "1.2.0"
default[:mod_cluster][:url] = "http://downloads.jboss.org/mod_cluster/#{node[:mod_cluster][:version]}.Final/mod_cluster-#{node[:mod_cluster][:version]}.Final-linux2-x64-so.tar.gz"

default[:mod_cluster][:mod_cluster_dir] = "/opt/mod_cluster-current"

# The IP and port mod_cluster will listen for management protocol
# messages on
default[:mod_cluster][:mcpm_bind_ip] = "127.0.0.1"
default[:mod_cluster][:mcpm_port] = 6666
default[:mod_cluster][:balancer_name] = "mycluster"
