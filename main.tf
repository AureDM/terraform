module "docker_containers" {
  source = "github.com/auredm/terraform"

  image          = "nginx:latest"
  memory         = 256
  privileged     = false
  num_containers = 3
  starting_port  = 3000
}

output "container_info" {
  value = module.docker_containers
}

