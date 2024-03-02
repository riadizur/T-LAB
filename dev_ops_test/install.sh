#!/bin/bash

# Update paket dan instalasi dependensi
sudo apt update
sudo apt upgrade -y

# Installasi Git
sudo apt install git -y

# Konfigurasi Git
git config --global user.name "Your Name"
git config --global user.email "youremail@example.com"

# Akses GitHub (menggunakan kredensial HTTPS)
echo "Masukkan username GitHub:"
read USERNAME
echo "Masukkan token akses GitHub:"
read -s TOKEN

# Cloning repositori dari GitHub
git clone https://$USERNAME:$TOKEN@github.com/docker-archive/swarm-microservice-demo-v1.git

# Installasi Docker
sudo apt install docker.io -y
sudo systemctl start docker
sudo systemctl enable docker

# Installasi Kubernetes
sudo apt-get update && sudo apt-get install -y apt-transport-https curl
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee -a /etc/apt/sources.list.d/kubernetes.list
sudo apt-get update
sudo apt-get install -y kubelet kubeadm kubectl
sudo apt-mark hold kubelet kubeadm kubectl

# Inisialisasi Kubernetes
sudo kubeadm init --pod-network-cidr=10.244.0.0/16

# Simpan token dan hash CA untuk digunakan oleh node
TOKEN=$(sudo kubeadm token generate)
HASH=$(sudo openssl x509 -pubkey -in /etc/kubernetes/pki/ca.crt | sudo openssl rsa -pubin -outform der 2>/dev/null | sudo openssl dgst -sha256 -hex | sed 's/^.* //')

# Di server lain (node)
# Ganti <master_ip> dengan IP server master
sudo kubeadm join <master_ip>:6443 --token $TOKEN --discovery-token-ca-cert-hash sha256:$HASH

# Konfigurasi kubectl untuk pengguna
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

# Installasi plugin jaringan (contoh: Calico)
kubectl apply -f https://docs.projectcalico.org/v3.8/manifests/calico.yaml