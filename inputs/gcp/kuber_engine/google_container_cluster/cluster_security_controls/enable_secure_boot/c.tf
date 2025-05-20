# Describe your resource type here
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "google_container_cluster" "c" {
  name = "compliant-secure-boot"

  node_config {
    shielded_instance_config {
      enable_secure_boot = true
    }
  }
}
