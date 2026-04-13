resource "google_database_migration_service_private_connection" "c" {
  display_name          = "c"
  location              = "australia-southeast2"
  private_connection_id = "my-connection"
  project               = "gcp-project-id"

  vpc_peering_config {
    vpc_name = google_compute_network.network_c.id
    subnet   = "10.0.0.0/29"
  }
}

resource "google_compute_network" "network_c" {
  name                    = "my-network"
  auto_create_subnetworks = false
  project                 = "my-gcp-project-id"
}