resource "google_database_migration_service_private_connection" "c" {
  project               = "my-gcp-project-id"
  display_name          = "compliant-private-connection"
  location              = "us-central1"
  private_connection_id = "compliant-conn"

  labels = {
    team = "security"
    env  = "prod"
  }

  vpc_peering_config {
    vpc_name = "projects/fake/global/networks/fake"
    subnet   = "10.0.0.0/29"
  }
}
