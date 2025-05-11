resource "google_database_migration_service_migration_job" "nc" {
  project          = "your-gcp-project-id"
  location         = "us-central1"
  migration_job_id = "noncompliant-static-ip"
  display_name     = "Migration Without Static IP"
  type             = "CONTINUOUS"

  # Using alternative connectivity to ensure Terraform plan works
  vpc_peering_connectivity {
    vpc = "dummy-vpc"
  }

  source      = "projects/proj-id/locations/us-central1/connectionProfiles/source"
  destination = "projects/proj-id/locations/us-central1/connectionProfiles/destination"
}
