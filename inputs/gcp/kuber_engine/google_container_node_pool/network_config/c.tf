# Describe your resource type here
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "google_container_node_pool" "c" {
  name     = "secure-node-pool"
  cluster  = "projects/my-project/locations/australia-southeast2/clusters/my-cluster"
  project  = "my-project"

  network_config {
    create_pod_range          = true
    enable_private_nodes      = true
    pod_ipv4_cidr_block       = "10.96.0.0/14"
    pod_range                 = "my-secondary-range"
    pod_cidr_overprovision_config {
      disabled = false
    }
    network_performance_config {
      total_egress_bandwidth_tier = "TIER_1"
    }
  }
}
