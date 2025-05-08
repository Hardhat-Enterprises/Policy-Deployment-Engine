# Describe your resource type here
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "google_container_cluster" "c" {
  name = "secure-cluster"

  master_authorized_networks_config {
    # No cidr_blocks = only internal GKE access allowed
  }

  enable_legacy_abac = false

  node_config {
    shielded_instance_config {
      enable_secure_boot          = true
      enable_integrity_monitoring = true
    }
  }
}
