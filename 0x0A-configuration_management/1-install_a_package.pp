#Using Puppet, install flask from pip3.
exec { 'install_flask':
  command     => 'pip3 install flask==2.1.0',
  creates     => '/usr/local/lib/python3.x/site-packages/flask/__init__.py', # Adjust the path based on your Python installation
  refreshonly => true,
}
