# Describe your resource type here
# Keep "c" as the name to indicate that this resource and its attributes are compliant
resource "google_container_cluster" "c" {
  name = "compliant-monitoring"

  monitoring_config {
    enable_components = ["SYSTEM_COMPONENTS", "APISERVER", "CONTROLLER_MANAGER"]
  }
}
