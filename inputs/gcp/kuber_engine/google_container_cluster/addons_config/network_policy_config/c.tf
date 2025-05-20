# Describe your resource type here
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "google_container_cluster" "c" {
  name = "compliant-network-policy"

  addons_config {
    network_policy_config {
      disabled = false
    }
  }
}
