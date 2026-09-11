resource "google_vmwareengine_private_cloud" "non_compliant_example_1" {
  location    = "australia-southeast1"
  name        = "non_compliant_example_1"
  description = "Sample test PC."

  network_config {
    management_cidr       = "0.0.0.0/0"
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