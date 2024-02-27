#set up your client SSH configuration file
file_line { 'private key':
  path  => '/etc/ssh/ssh_config',
  line  => '    IdentityFile ~/.ssh/school',
  match => '^#?\s*IdentityFile.*',
}

file_line { 'password':
  path  => '/etc/ssh/ssh_config',
  line  => '    PasswordAuthentication no',
  match => '^#?\s*PasswordAuthentication.*',
}