# main.tf
provider "docker" {
  host = "tcp://localhost:2375/"
}

resource "docker_container" "nginx" {
  image = "nginx:latest"
  name  = "example"
  ports {
    internal = 80
    external = 8080
  }
}
