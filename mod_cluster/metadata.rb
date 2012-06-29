maintainer       "Ben Browning"
maintainer_email "ben324@gmail.com"
license          "Apache 2.0"
description      "Installs/Configures mod_cluster"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.0.1"

depends "apache2"
depends "runit"
depends "silverware"

supports "ubuntu"
supports "debian"
