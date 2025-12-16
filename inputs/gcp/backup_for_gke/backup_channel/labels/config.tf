##### DO NOT EDIT ######

terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
    }
  }
}

provider "google" {}

variable "gcp_project" {
  default = "fluent-coder-468700-h4"
}