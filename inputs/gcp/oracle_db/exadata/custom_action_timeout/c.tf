# Describe your resource type here
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "google_oracle_database_cloud_exadata_infrastructure" "c" {
    location = "australia-southeast1"
    cloud_exadata_infrastructure_id = "my-instance"
    project = "my-project-c"
    properties {
        shape = "exadata-x9m"
      maintenance_window {
        is_custom_action_timeout_enabled = true
      }
    }
}