# main.tf

terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 2.0"
    }
  }
}

provider "docker" {}

# Pull the nginx image
resource "docker_image" "nginx" {
  name = "nginx:latest"
}

# Run a container using the nginx image
resource "docker_container" "nginx_container" {
  name  = "nginx-container"
  image = docker_image.nginx.image_id
  ports {
    internal = 80
    external = 8081
  }
}
