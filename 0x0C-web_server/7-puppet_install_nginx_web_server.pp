package { 'nginx' :
	ensure => install,
}

service { 'nginx' :
	ensure => running,
	enable => true,
}


file { '/etc/nginx/sites-available/default':
     ensure  => file,
     content => "server {
        listen 80 default_server;
        listen [::]:80 default_server;
        rewrite ^/redirect_me https://www.youtube.com/watch?v=QH2-TGUlwu4 permanent;  root /var/www/html;

        # Add index.php to the list if you are using PHP
        index index.html index.htm index.nginx-debian.html;

        server_name _;

        location / {
                # First attempt to serve request as file, then
                # as directory, then fall back to displaying a 404.
                try_files $uri $uri/ =404;
        }  root /var/www/html;

        # Add index.php to the list if you are using PHP
        index index.html index.htm index.nginx-debian.html;

        server_name _;

        location / {
                # First attempt to serve request as file, then
                # as directory, then fall back to displaying a 404.
                try_files $uri $uri/ =404;
        }
}"
	notify => Service['nginx'],
}
