maintainer       "Ben Browning"
maintainer_email "ben324@gmail.com"
license          "Apache 2.0"
description      "Installs/Configures torquebox"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.0.3"

depends "install_from"
depends "java"
depends "runit"
depends "silverware"

supports "ubuntu"
supports "debian"

