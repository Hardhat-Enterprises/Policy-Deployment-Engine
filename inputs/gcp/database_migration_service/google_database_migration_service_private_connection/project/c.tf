resource "google_compute_network" "network_c" {
  name                    = "my-network-c"
  auto_create_subnetworks = false
  project                 = "my-gcp-project-id"
}

resource "google_database_migration_service_private_connection" "c" {
  project               = "my-gcp-project-id"
  display_name          = "dbms-compliant"
  location              = "us-central1"
  private_connection_id = "compliant-project"

  vpc_peering_config {
    vpc_name = google_compute_network.network_c.id
    subnet   = "10.0.0.0/29"
  }
}
