##### DO NOT EDIT ######

terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
    }
  }
}

provider "google" {}

# Add this variable definition if you want to use var.gcp_project
variable "gcp_project" {
  default = "fluent-coder-468700-h4"
}