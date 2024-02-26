#Using Puppet, install flask from pip3.
exec { 'install flask':
    command => 'pip3 install flask==2.0.1',
    path    => '/bin/',
}