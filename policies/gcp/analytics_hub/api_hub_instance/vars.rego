package terraform.gcp.api_hub.api_hub_instance

# Allowed locations
default allowed_locations = ["us-central1"]

# Required labels
default required_labels = {
  "environment": "dev"
}
