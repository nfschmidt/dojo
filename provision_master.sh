#!/bin/bash

NEW_HOSTNAME="$1"
IP="$2"
echo $NEW_HOSTNAME > /etc/hostname
hostname $NEW_HOSTNAME
egrep "^$IP ${NEW_HOSTNAME}$" /etc/hostname || echo "$IP $NEW_HOSTNAME" >> /etc/hosts

kubeadm init --apiserver-advertise-address $IP --pod-network-cidr 10.32.0.0/12 --service-cidr 10.32.0.0/12 | tee /root/kubernetes_install.out

cp /etc/kubernetes/admin.conf $HOME/
chown $(id -u):$(id -g) $HOME/admin.conf
export KUBECONFIG=$HOME/admin.conf

kubectl apply -f https://git.io/weave-kube-1.6 2>&1 | tee -a /root/kubernetes_install.out

kubectl create -f https://git.io/kube-dashboard
