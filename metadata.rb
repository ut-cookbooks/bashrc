maintainer        "Fletcher Nichol"
maintainer_email  "fnichol@nichol.ca"
license           "Apache 2.0"
description       "Installs/Configures fnichol/bashrc"
long_description  IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version           "0.2.0"
recipe            "bashrc", "Installs github.com/fnichol/bashrc bash profile"

%w{ ubuntu suse }.each do |os|
  supports os
end

%w{ git }.each do |cb|
  depends cb
end
