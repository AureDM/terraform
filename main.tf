terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "3.0.2"
    }
  }
}

provider "docker" {
  host = "unix:///var/run/docker.sock"
}

resource "docker_image" "image" {
  name = var.image
}

resource "docker_container" "containers" {
  count = var.num_containers

  image = docker_image.image.image_id
  name  = "container_${count.index + 1}"

  memory = var.memory
  privileged = var.privileged

  ports {
    internal = 80
    external = var.starting_port + count.index
  }

  entrypoint = ["/bin/sh", "-c"]
  command    = ["rm -f /usr/share/nginx/html/index.html && echo $(hostname) > /usr/share/nginx/html/index.html && exec nginx -g 'daemon off;'"]
}
