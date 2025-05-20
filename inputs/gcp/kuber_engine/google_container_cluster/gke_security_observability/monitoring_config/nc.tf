# Describe your resource type here
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant

resource "google_container_cluster" "nc" {
  name = "noncompliant-monitoring"

  monitoring_config {
    enable_components = ["APISERVER"] # Missing SYSTEM_COMPONENTS and CONTROLLER_MANAGER
  }
}
