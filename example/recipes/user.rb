user_home = value_for_platform_family(
  "mac_os_x" => "/Users/jane",
  "default" => "/home/jane"
)

user "jane" do
  home user_home
  manage_home true
  shell "/bin/bash"
  gid "admin" if platform_family?("mac_os_x") # on mac, no group, no create :(
end

# Looks like the user doesn't own their own home directory on
# mac_os_x platforms, so let's fix that up
directory user_home do
  owner "jane"
  only_if { platform_family?("mac_os_x") }
end

bashrc "jane"
