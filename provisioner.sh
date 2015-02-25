sudo apt-get update
sudo apt-get -y upgrade
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password password root'
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password root'

sudo apt-get -y install default-jre git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties libgdbm-dev libncurses5-dev automake libtool bison libffi-dev mysql-server mysql-client libmysqlclient-dev mysql-server mysql-client libmysqlclient-dev nginx

su -c "/vagrant/install-rvm.sh" vagrant
# su -c "/vagrant/install-gems.sh" vagrant