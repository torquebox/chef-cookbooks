These cookbooks depend on the silverware cookbook from
https://github.com/infochimps-labs/ironfan-pantry for service
discovery.

Things are still a work-in-progress. There may be bugs.

Things are mainly tested when used in conjuction with [Ironfan]
(https://github.com/infochimps-labs/ironfan) on Amazon EC2.

In combination with Ironfan, these cookbooks let us do things like

    knife cluster launch torquebox-frontend --bootstrap
    knife cluster launch torquebox-backend-0 --bootstrap
    knife cluster launch torquebox-backend-1 --bootstrap

The above commands bring up a mod_cluster server and two TorqueBox
servers with all clustering setup. The nodes were launch one at a time
because there are likely some race conditions in the service discovery
currently being used that need to be sorted out.

New TorqueBox (torquebox-backend) servers can be added at any time and
will join the cluster as expected. However, when a new mod_cluster
(torquebox-frontend) cluster is added the existing TorqueBox servers
won't automatically connect to it. You'll need to re-run chef-client
on the TorqueBox servers then restart TorqueBox (`sv restart torquebox`)
to get the backend servers talking to the new mod_cluster
instance.
