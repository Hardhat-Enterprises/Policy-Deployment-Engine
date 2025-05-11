resource "google_database_migration_service_migration_job" "c" {
  project          = "your-gcp-project-id"
  location         = "us-central1"
  migration_job_id = "compliant-logical"
  display_name     = "Logical Dump Migration"
  type             = "CONTINUOUS"
  dump_type        = "LOGICAL"

  static_ip_connectivity {}

  source      = "projects/proj-id/locations/us-central1/connectionProfiles/source"
  destination = "projects/proj-id/locations/us-central1/connectionProfiles/destination"
}
