resource "google_database_migration_service_private_connection" "nc" {
  project               = " "  # ❗ Required to trigger OPA policy
  display_name          = "noncompliant-project"
  location              = "us-central1"
  private_connection_id = "nc-id"

  vpc_peering_config {
    vpc_name = "projects/my-project/global/networks/my-network"
    subnet   = "10.0.0.0/29"
  }
}
