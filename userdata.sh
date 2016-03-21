#!/bin/bash -v
### Install base depenedencies. We should use Packer to build a base image instead
apt-get update -y
apt-get install -y nginx >> /tmp/install.log
apt-get install -y openjdk-7-jdk >> /tmp/install.log

cd /tmp
wget http://download.jboss.org/jbossas/7.1/jboss-as-7.1.1.Final/jboss-as-7.1.1.Final.tar.gz
tar xfvz jboss-as-7.1.1.Final.tar.gz
mv jboss-as-7.1.1.Final /usr/local/share/jboss
adduser appserver
chown -R appserver /usr/local/share/jboss

echo "Completed Install." >> /tmp/install.log

# Start the JBoss server
su - appserver -c '/usr/local/share/jboss/bin/standalone.sh -Djboss.bind.address=0.0.0.0 -Djboss.bind.address.management=0.0.0.0 &'
