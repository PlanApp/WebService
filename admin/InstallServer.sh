apt-get update
apt-get install -y byobu
apt-get install -y aptitude
apt-get install -y apache2
apt-get install -y php5 libapache-mod-php5
/etc/init.d/apache restart
apt-get install -y postgresql-9.3
apt-get install -y php5-pgsql
apt-get install -y libapache2-mod-auth-pgsql
/etc/init.d/apache2 restart
/etc/init.d/postgresql-9.3 restart

