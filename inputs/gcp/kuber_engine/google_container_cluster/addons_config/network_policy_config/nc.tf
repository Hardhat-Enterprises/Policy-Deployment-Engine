# Describe your resource type here
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant

resource "google_container_cluster" "nc" {
  name = "noncompliant-network-policy"

  addons_config {
    network_policy_config {
      disabled = true
    }
  }
}

