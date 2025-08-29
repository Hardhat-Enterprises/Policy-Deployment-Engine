terraform {
  required_providers {
    null = {
      source  = "hashicorp/null"
      version = ">= 3.0.0"
    }
  }
}

variable "auth_token_expiry" {
  description = "Mock value for auth token expiry (in seconds)"
  type        = number
  default     = 3600
}

resource "null_resource" "mock_auth_token_expiry_test" {
  provisioner "local-exec" {
    command = "echo Testing auth_token_expiry: ${var.auth_token_expiry}"
  }
}

output "mock_auth_token_expiry" {
  value = var.auth_token_expiry
}
