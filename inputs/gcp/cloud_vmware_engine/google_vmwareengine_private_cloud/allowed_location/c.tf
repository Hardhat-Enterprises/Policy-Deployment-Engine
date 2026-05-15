resource "google_vmwareengine_private_cloud" "c" {
  project     = "project-d7f19645-ccba-48ef-bce"
  location    = "australia-southeast1"
  name        = "c"
  description = "c"
  network_config {
    management_cidr       = "192.168.30.0/24"
    vmware_engine_network = "projects/599444694846/locations/global/vmwareEngineNetworks/c"
  }
  management_cluster {
    cluster_id = "c"
    node_type_configs {
      node_type_id = "standard-72"
      node_count   = 3
    }
  }
}
