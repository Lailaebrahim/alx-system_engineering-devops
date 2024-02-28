#install nginx web server
package { 'nginx' :
	ensure => installed,
}

#start nginx service
service { 'nginx' :
	ensure => running,
	enable => true,
}


#Configure your Nginx server so that /redirect_me is redirecting to another page.
file { '/etc/nginx/sites-available/default':
     ensure  => file,
     content => "server {
        listen 80 default_server;
        listen [::]:80 default_server;
        rewrite ^/redirect_me https://www.youtube.com/watch?v=QH2-TGUlwu4 permanent;  
	root /var/www/html;
        index index.html index.htm index.nginx-debian.html;

        server_name _;

        location / {
                # First attempt to serve request as file, then
                # as directory, then fall back to displaying a 404.
                try_files $uri $uri/ =404;
        }  root /var/www/html;

}"
	notify => Service['nginx'],
}

#Nginx at its root return a page that contains the string Hello World!
file {'/var/www/html/index.nginx-debian.html':
     ensure => file,
     content => 'Hello World!"
     notify => Service['nginx'],
}
