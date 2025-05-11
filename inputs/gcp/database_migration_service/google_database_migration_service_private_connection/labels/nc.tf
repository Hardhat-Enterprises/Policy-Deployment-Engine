resource "google_database_migration_service_private_connection" "nc" {
  project               = " "  # 👈 Intentionally empty or fake
  display_name          = "noncompliant-private-connection"
  location              = "us-central1"
  private_connection_id = "noncompliant-conn"

  # 👇 This is missing labels completely (will be null in plan)
  vpc_peering_config {
    vpc_name = "projects/fake/global/networks/fake"
    subnet   = "10.0.0.0/29"
  }
}
