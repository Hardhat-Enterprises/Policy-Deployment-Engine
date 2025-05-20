# Describe your resource type here
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "google_container_cluster" "c" {
  name = "compliant-master-networks"

  master_authorized_networks_config {
    # No cidr_blocks = only internal GKE access allowed
  }

}
