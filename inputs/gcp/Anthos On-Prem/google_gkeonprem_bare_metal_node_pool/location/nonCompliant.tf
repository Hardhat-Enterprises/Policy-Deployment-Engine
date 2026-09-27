resource "google_gkeonprem_bare_metal_node_pool" "non_compliant_example_1" {
  name =  "non_compliant_example_1"
  project =  "PDE"
  location = "asia1"
  bare_metal_cluster =  "my-cluster"
  node_pool_config {
    operating_system = "LINUX"
    node_configs {
      node_ip = "10.200.0.11"
    }
  }
}
