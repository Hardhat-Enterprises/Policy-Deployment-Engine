resource "google_database_migration_service_migration_job" "nc" {
  project          = "your-gcp-project-id"
  location         = "us-central1"
  migration_job_id = "noncompliant-env-label"
  display_name     = "Migration Without Env Label"
  type             = "CONTINUOUS"

  labels = {
    team = "devops"
  }

  static_ip_connectivity {}

  source      = "projects/proj-id/locations/us-central1/connectionProfiles/source"
  destination = "projects/proj-id/locations/us-central1/connectionProfiles/destination"
}
