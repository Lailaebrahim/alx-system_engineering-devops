#update system
exec { 'update system':
  command => '/usr/bin/apt-get update',
}

#install nginx web server
package { 'nginx' :
  ensure  => installed,
  require => Exec['update system']
}

#start nginx service
service { 'nginx' :
  ensure  => running,
  require => Package['nginx']
}

#write Hello World! in the root page
file {'/var/www/html/index.nginx-debian.html':
  content => 'Hello World!',
  notify  => Service['nginx'],
}

#configure nginx server to redirect page redirect_me to another
exec {'redirect_me':
  command  => 'sudo sed -i "24i\	rewrite ^/redirect_me https://www.youtube.com/watch?v=QH2-TGUlwu4 permanent;" /etc/nginx/sites-available/default',
  provider => 'shell',
  notify   => Service['nginx'],
}