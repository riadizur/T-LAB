# T-LAB
T-LAB test

1. Buatlah bash script yang bisa mengecek apakah suatu bilangan itu bilangan prima atau bukan (Point 20).
Contoh output :
$ ./prima.sh 5
bilangan ini adalah bilangan prima
$ ./prima.sh 8
bilangan ini bukan bilangan prima

2. Deploy service demo microservice https://github.com/docker-archive/swarm-microservice-demo-v1 dengan spesifikasi environment sebagai berikut (Point 80) :
a. Siapkan 3 unit server. Bisa dalam bentuk VM di laptop/PC atau VPS.
b. Setup cluster kubernetes di 3 server diatas.
c. Sample service diatas dirancang untuk dideploy di docker swarm. Sesuaikan agar service berjalan lancar diatas kubernetes.
d. Setup sistem CI untuk service diatas.
e. Kemudian dokumentasikan secara lengkap langkah-langkah deployment tadi mulai dari instalasi OS VM/VPS, setup kubernetes, deployment service, deployment ci/cd, sampai ke demonstrasi fitur CI.
f. Dokumen diatas bisa dalam bentuk pdf/doc & script deployment harus ikut disertakan dengan ketentuan yang telah dijelaskan di halaman terakhir dokumen soal ini.
g. Bonus poin apabila menggunakan :
   1.) terraform/ansible untuk deployment & setup VM/VPS
   2.) Rancher untuk deployment kubernetes
   3.) Gitlab / jenkins untuk CI
   4.) Setup logging service dengan ELK/grafana loki
   5.) Setup monitoring & alerting dengan grafana & prometheus
