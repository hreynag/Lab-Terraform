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
    external = var.web_server_port
    internal = 80
  }
}

# Contenedor para Conexión a BD MYSQL
resource "docker_image" "mysql" {
  name = "mysql:9.0.1"
}

resource "docker_container" "mysql_db" {
  name  = "mysql-db"
  image = docker_image.mysql.latest
  env = [
    "MYSQL_ROOT_PASSWORD=pass",
    "MYSQL_DATABASE=Prueba_TestBD",
    "MYSQL_USER=user_test",
    "MYSQL_PASSWORD=test_1234"
  ]
  ports {
    internal = 3306
    external = var.server_db_port
  }
}