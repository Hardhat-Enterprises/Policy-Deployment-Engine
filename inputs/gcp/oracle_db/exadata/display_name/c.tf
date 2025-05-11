# Describe your resource type here
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "google_oracle_database_cloud_exadata_infrastructure" "c" {
    location = "AU"
    cloud_exadata_infrastructure_id = "my-instance"
    project = "my-project-c"

    display_name = "prod-exadata-1"
}
