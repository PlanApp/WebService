echo -e "GNU Linux: \n 1)-Debian \n 2)-Ubuntu \n 3)-Centeo \n 4)-RedHat \n Enter the number:"
read distro


#DEB
if [ $distro = 1 ] || [ $distro = 2 ]; then
	sudo apt-get install -y apache2 libapache2-mod-wsgi  libapache2-mod-python
	sudo apt-get install -y python-flask
fi

#RPM
if [ $distro = 3 ] || [ $distro = 3 ]; then
	sudo yum -y install httpd mod_wsgi.x86_64  python-httplib2.noarch  python-rest-client.noarch  python-requests.noarch 
	sudo yum -y install python-flask
fi
