name              "bashrc"
maintainer        "Fletcher Nichol"
maintainer_email  "fnichol@nichol.ca"
license           "Apache 2.0"
description       "Installs a bash profile from http://github.com/fnichol/bashrc."
long_description  IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version           "0.3.5"

supports "ubuntu"
supports "suse"
supports "mac_os_x"

depends "git"
