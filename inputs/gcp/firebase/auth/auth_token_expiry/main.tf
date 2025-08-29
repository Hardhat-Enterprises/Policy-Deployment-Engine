terraform {
  required_providers {
    null = {
      source = "hashicorp/null"
    }
  }
}

provider "null" {}

# Mock Firebase Auth tenant for testing
resource "null_resource" "test_tenant" {
  triggers = {
    name      = "test-tenant"
    token_ttl = "3600" # pretend expiry in seconds
  }
}
