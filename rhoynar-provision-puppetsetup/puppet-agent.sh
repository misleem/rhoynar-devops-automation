#!/bin/bash
#This script designed for setup of puppet agent in debian jessie#

hostname1="$1"
masterhost="$4   $3.example.com $3 puppet"
agenthost="$2    $1.example.com $1"
server='puppet'
certname="$1.example.com"

#setting hostname of server 
echo $hostname1 > /etc/hostname
hostname $hostname1

#Adding hostentries
echo $masterhost >> /etc/hosts
echo $agenthost >> /etc/hosts

#installing puppet-agent
 /usr/bin/apt-get -y update
 /usr/bin/apt-get -y install puppet

#puppet configuration
echo '[agent]' >> /etc/puppet/puppet.conf
echo "server = $server" >> /etc/puppet/puppet.conf
echo "certname = $certname" >> /etc/puppet/puppet.conf

# Starting puppet-agent
service puppet restart
#puppet agent --test
puppet agent --enable
