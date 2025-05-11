# Describe your resource type here
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant

resource "google_container_node_pool" "nc" {
  name     = "insecure-node-pool"
  cluster  = "projects/my-project/locations/australia-southeast2/clusters/my-cluster"
  project  = "my-project"

  network_config {
    create_pod_range          = true
    enable_private_nodes      = false
    pod_ipv4_cidr_block = "0.0.0.0/0"
    pod_range                 = "untrusted-secondary-range"
    pod_cidr_overprovision_config {
      disabled = true
    }
    network_performance_config {
      total_egress_bandwidth_tier = "TIER_1"
    }
  }
}
