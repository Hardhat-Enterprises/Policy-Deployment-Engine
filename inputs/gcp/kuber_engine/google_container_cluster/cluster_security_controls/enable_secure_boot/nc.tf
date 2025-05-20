# Describe your resource type here
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant

resource "google_container_cluster" "nc" {
  name = "noncompliant-secure-boot"

  node_config {
    shielded_instance_config {
      enable_secure_boot = false
    }
  }
}
