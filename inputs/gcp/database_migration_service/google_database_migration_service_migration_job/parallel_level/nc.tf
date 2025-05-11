resource "google_database_migration_service_migration_job" "nc" {
  project = "my-gcp-project-id"
  location         = "us-central1"
  migration_job_id = "noncompliant-performance"
  display_name     = "Slow Performance"
  type             = "CONTINUOUS"

  performance_config {
    dump_parallel_level = "MIN"
  }

  static_ip_connectivity {}

  source      = "projects/proj-id/locations/us-central1/connectionProfiles/source"
  destination = "projects/proj-id/locations/us-central1/connectionProfiles/destination"
}
