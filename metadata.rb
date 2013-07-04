name              "bashrc"
maintainer        "Fletcher Nichol"
maintainer_email  "fnichol@nichol.ca"
license           "Apache 2.0"
description       "Installs a bash profile from http://github.com/fnichol/bashrc."
long_description  IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version           "0.3.3"

recipe            "bashrc",         "Common installation prerequisites; not meant to be included explicitly. See bashrc::system and bashrc::user for more details."
recipe            "bashrc::system", "Installs fnichol's bash profile system-wide (in /etc/bashrc)."
recipe            "bashrc::user",   "Installs fnichol's bash profile for a list of users (selected from the node['bashrc']['user_installs'] hash)."

supports "ubuntu"
supports "suse"
supports "mac_os_x"

depends "git"
