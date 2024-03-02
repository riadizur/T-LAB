# Di server pertama (master)
sudo kubeadm init --pod-network-cidr=10.244.0.0/16

# Setelah berhasil, jalankan perintah yang diberikan oleh kubeadm untuk bergabung dengan cluster
# Misal: sudo kubeadm join <ip_master>:<port> --token <token> --discovery-token-ca-cert-hash <hash>

# Di server lain (node)
# Bergabungkan node ke dalam cluster sesuai dengan perintah yang dihasilkan oleh kubeadm init