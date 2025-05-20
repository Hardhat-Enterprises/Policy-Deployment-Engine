# Describe your resource type here
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant
resource "google_container_cluster" "nc" {
  name = "noncompliant-http-lb"

  addons_config {
    http_load_balancing {
      disabled = true
    }
  }
}
