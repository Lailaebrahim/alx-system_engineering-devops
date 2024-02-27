#set up your client SSH configuration file
file_line { 'private key'
    path  => '~/etc/ssh/ssh_config',
    match => 'IdentityFile.*'
    line  => 'IdentityFile ~/.ssh/school',
    }
file_line { 'password'
    path  => '~/etc/ssh/ssh_config',
    match => 'PasswordAuthentication.*',
    line  => 'PasswordAuthentication no',
}