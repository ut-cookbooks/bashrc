maintainer        "Fletcher Nichol"
maintainer_email  "fnichol@nichol.ca"
license           "Apache 2.0"
description       "Installs/Configures fnichol/bashrc"
long_description  IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version           "0.2.1"
recipe            "bashrc", "Installs github.com/fnichol/bashrc bash profile"

%w{ ubuntu suse }.each do |os|
  supports os
end

%w{ git }.each do |cb|
  depends cb
end

attribute "bashrc/update",
  :display_name => "Update bashrc on each Chef run?",
  :description  => "Whether or not to update *bashrc* on every Chef execution.",
  :default      => false

attribute "bashrc/install_url",
  :display_name => "URL for installer script",
  :description  => "The URL containing the installer script.",
  :default      => "http://bit.ly/bashrc-install-system-wide"
