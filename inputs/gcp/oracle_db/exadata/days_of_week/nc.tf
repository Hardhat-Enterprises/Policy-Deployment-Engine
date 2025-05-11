# Describe your resource type here
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant

resource "google_oracle_database_cloud_exadata_infrastructure" "nc" {
    location = "australia-southeast1"
    cloud_exadata_infrastructure_id = "my-instance"
    project = "my-project-nc"
    properties {
        shape = "exadata-x9m"
      maintenance_window {
        days_of_week = ["SUNDAY"]
      }
    }
}