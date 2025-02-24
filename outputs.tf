output "container_names" {
  description = "Names of the created containers"
  value       = docker_container.containers[*].name
}

output "container_ports" {
  description = "Ports of the created containers"
  value       = [for i in range(var.num_containers) : var.starting_port + i]
}
