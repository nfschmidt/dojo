#!/bin/bash

NEW_HOSTNAME="$1"
IP="$2"
echo $NEW_HOSTNAME > /etc/hostname
hostname $NEW_HOSTNAME
egrep "^$IP ${NEW_HOSTNAME}$" /etc/hostname || echo "$IP $NEW_HOSTNAME" >> /etc/hosts
