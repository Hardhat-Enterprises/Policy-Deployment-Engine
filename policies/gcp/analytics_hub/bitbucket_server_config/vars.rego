package terraform.gcp.cloudbuild.bitbucket_server_config

# Allowed locations
default allowed_locations = ["us-central1"]

# Required labels
default required_labels = {
  "environment": "dev"
}
