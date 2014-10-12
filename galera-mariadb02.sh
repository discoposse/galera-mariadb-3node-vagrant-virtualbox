export DEBIAN_FRONTEND=noninteractive
debconf-set-selections <<< 'mariadb-server-5.5 mysql-server/root_password password MariaDBPass'
debconf-set-selections <<< 'mariadb-server-5.5 mysql-server/root_password_again password MariaDBPass'

sudo apt-get -y update
sudo apt-get -y install python-software-properties vim 
sudo apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0xcbcb082a1bb943db
sudo add-apt-repository 'deb http://mirror.jmu.edu/pub/mariadb/repo/5.5/ubuntu precise main'
sudo apt-get update -y 
sudo apt-get install -y --force-yes mariadb-galera-server galera rsync sshpass

echo "
[mysqld]
query_cache_size=0
binlog_format=ROW
default-storage-engine=innodb
innodb_autoinc_lock_mode=2
query_cache_type=0
bind-address=0.0.0.0

# Galera Provider Configuration
wsrep_provider=/usr/lib/galera/libgalera_smm.so
#wsrep_provider_options=gcache.size=32G

# Galera Cluster Configuration
wsrep_cluster_name=test_cluster
wsrep_cluster_address=gcomm://172.16.0.150,172.16.0.151,172.16.0.152

# Galera Synchronization Congifuration
wsrep_sst_method=rsync
#wsrep_sst_auth=user:pass

# Galera Node Configuration
wsrep_node_address=172.16.0.151
wsrep_node_name=galera-mariadb02
" | sudo tee -a /etc/mysql/conf.d/cluster.cnf 

sudo cp /vagrant/debian.conf /etc/mysql/

sudo service mysql stop 


