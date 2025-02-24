variable "image" {
  description = "Docker image to use"
  type        = string
  default     = "nginx:latest"

  validation {
    condition     = length(var.image) > 5 && substr(var.image, 0, 5) == "nginx"
    error_message = "The image must be a valid Nginx image, starting with 'nginx'."
  }
}

variable "memory" {
  description = "Memory limit for the container"
  type        = number
  default     = 128

  validation {
    condition     = var.memory >= 64 && var.memory <= 1024
    error_message = "The memory must be between 64 and 1024 MB."
  }
}

variable "privileged" {
  description = "Run container in privileged mode"
  type        = bool
  default     = false
}

variable "num_containers" {
  description = "Number of containers to spawn"
  type        = number
  default     = 1

  validation {
    condition     = var.num_containers > 0 && var.num_containers <= 10
    error_message = "The number of containers must be between 1 and 10."
  }
}

variable "starting_port" {
  description = "Starting port for the containers"
  type        = number
  default     = 3000

  validation {
    condition     = var.starting_port >= 1024 && var.starting_port <= 65535
    error_message = "The starting port must be between 1024 and 65535."
  }
}

