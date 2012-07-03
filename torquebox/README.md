# TorqueBox Chef


## Running on EC2

To get TorqueBox to listen on the private EC2 IP Address, you'll want
to override the following attribute:

    node[:torquebox][:bind_ip] = ["cloud", "local_ipv4"]

To create a TorqueBox cluster with these recipes on EC2, you'll want
to override the following attribute:

    node[:torquebox][:clustered] = true

In clustered mode, when the TorqueBox instance boots it should
auto-discover the previously booted mod_cluster instances and
TorqueBox cluster members. This is done via the silverware cookbook's
announce and discover_all capabilities.


## Running a 2.0.x-incremental Build of TorqueBox

If you'd prefer to run a 2.0.x-incremental build of TorqueBox instead
of the latest official release, override the following attributes:

    node[:torquebox][:url] = "http://repository-projectodd.forge.cloudbees.com/incremental/torquebox-2.0.x/18/torquebox-dist-bin.zip"
    node[:torquebox][:checksum] = nil
    node[:torquebox][:version] = "2.x.incremental.18"
    node[:torquebox][:ha_server_config_template] = "standalone-ha-2.0.x-incremental.xml.erb"

Be sure to change the "18" in the :url and :version above to whichever
2.0.x incremental release number you choose to run.
