resource "google_database_migration_service_migration_job" "c" {
  project = "my-gcp-project-id"
  location          = "us-central1"
  migration_job_id  = "compliant-migration"
  display_name      = "Compliant Migration Job"
  labels = {
    env = "prod"
  }
  type              = "CONTINUOUS"

  static_ip_connectivity {}

  source      = "projects/proj-id/locations/us-central1/connectionProfiles/source"
  destination = "projects/proj-id/locations/us-central1/connectionProfiles/destination"
}
