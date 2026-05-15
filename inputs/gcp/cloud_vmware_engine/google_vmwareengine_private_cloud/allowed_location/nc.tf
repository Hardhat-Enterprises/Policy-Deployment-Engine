resource "google_vmwareengine_private_cloud" "nc" {
  project     = "project-d7f19645-ccba-48ef-bce"
  location    = "us-west1-a"
  name        = "nc"
  description = "nc"
  network_config {
    management_cidr       = "192.168.30.0/24"
    vmware_engine_network = "projects/599444694846/locations/global/vmwareEngineNetworks/nc"
  }
  management_cluster {
    cluster_id = "nc"
    node_type_configs {
      node_type_id = "standard-72"
      node_count   = 3
    }
  }
}
