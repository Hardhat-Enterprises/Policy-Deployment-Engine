resource "google_vmwareengine_cluster" "nc" {
  name   = "nc"
  parent = "projects/599444694846/locations/us-west1-a/privateClouds/nc"
  node_type_configs {
    node_type_id = "standard-72"
    node_count   = 3
  }
}

