resource "google_vmwareengine_private_cloud" "non_compliant_example_1" {
  location    = "us-west1-a"
  name        = "non_compliant_example_1"
  description = "Sample test PC."
  network_config {
    management_cidr       = "192.168.30.0/24"
    vmware_engine_network = "projects/my-project/locations/global/vmwareEngineNetworks/pc-nw"
  }
  management_cluster {
    cluster_id = "sample-mgmt-cluster"
    node_type_configs {
      node_type_id = "standard-72"
      node_count   = 3
    }
  }
}

