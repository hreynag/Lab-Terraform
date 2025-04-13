terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "2.16.0"
    }
  }
}

provider "docker" {}

resource "docker_container" "container_server_web" {
  name = "server_web"
  image = "nginx:latest"
  ports {
    externa1 = 4000
    internal = 80
  }
}