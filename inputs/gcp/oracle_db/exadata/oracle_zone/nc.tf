# Describe your resource type here
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant

resource "google_oracle_database_cloud_exadata_infrastructure" "nc" {
    location = "asia-northeast2"
    cloud_exadata_infrastructure_id = "my-instance"
    project = "my-project-nc"

    gcp_oracle_zone = "asia-northeast2-a"
}