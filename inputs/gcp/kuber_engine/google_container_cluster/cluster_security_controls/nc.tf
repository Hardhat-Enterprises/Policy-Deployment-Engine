# Describe your resource type here
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant

resource "google_container_cluster" "nc" {
    name = "insecure-cluster"
  
    master_authorized_networks_config {
      cidr_blocks {
        cidr_block   = "0.0.0.0/0"
        display_name = "Allow all"
      }
    }
  
    enable_legacy_abac = true
  
    node_config {
      shielded_instance_config {
        enable_secure_boot          = false
        enable_integrity_monitoring = false
      }
    }
  }
  