# Edit OS Config to allow holberton user

exec {'OS Config':
    command => 'sed -i "s/holberton/foo/" /etc/security/limits.conf',
    path    => '/usr/bin/env/:/bin/:/usr/bin/:/usr/sbin/'
}