# mod_cluster Chef


## Running on EC2

To get mod_cluster to listen on the private EC2 IP Address, you'll want
to override the following attribute:

    node[:mod_cluster][:bind_ip] = ["cloud", "local_ipv4"]
