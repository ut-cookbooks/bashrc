maintainer        "Fletcher Nichol"
maintainer_email  "fnichol@nichol.ca"
license           "Apache 2.0"
description       "Manages fnichol's bashrc at https://github.com/fnichol/bashrc."
long_description  IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version           "0.2.1"

recipe            "bashrc", "Installs github.com/fnichol/bashrc bash profile"

supports "ubuntu"
supports "suse"
supports "mac_os_x"

depends "git"
