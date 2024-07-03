#!/bin/sh

mkdir /var/lib/jenkins/backup
mkdir /var/lib/jenkins/backup/jobs /var/lib/jenkins/backup/nodes /var/lib/jenkins/backup/plugins /var/lib/jenkins/backup/secrets /var/lib/jenkins/backup/users

cp /var/lib/jenkins/*.xml /var/lib/jenkins/backup/
cp -r /var/lib/jenkins/jobs/ /var/lib/jenkins/backup/jobs/
cp -r /var/lib/jenkins/nodes/ /var/lib/jenkins/backup/nodes/
cp /var/lib/jenkins/plugins/*.jpi /var/lib/jenkins/backup/plugins/
cp /var/lib/jenkins/secrets/* /var/lib/jenkins/backup/secrets/
cp -r /var/lib/jenkins/users/* /var/lib/jenkins/backup/users/

tar czvf /var/lib/jenkins/backup.tar.gz /var/lib/jenkins/backup/
/bin/sleep 5

username="tracy"
password="13_1n_33"
Ip="localhost"
sshpass -p "$password" scp /var/lib/jenkins/backup.tar.gz $username@$Ip:/home/tracy/backups
/bin/sleep 10

rm -rf /var/lib/jenkins/backup/
rm -rf /var/lib/jenkins/backup.tar.gz
