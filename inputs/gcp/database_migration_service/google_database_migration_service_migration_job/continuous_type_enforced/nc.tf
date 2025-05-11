resource "google_database_migration_service_migration_job" "nc" {
  project = "my-gcp-project-id"
  location          = "us-central1"
  migration_job_id  = "noncompliant-migration"
  display_name      = "Non-Compliant Migration Job"
  labels = {
    env = "test"
  }
  type              = "ONE_TIME"

  static_ip_connectivity {}

  source      = "projects/proj-id/locations/us-central1/connectionProfiles/source"
  destination = "projects/proj-id/locations/us-central1/connectionProfiles/destination"
}
