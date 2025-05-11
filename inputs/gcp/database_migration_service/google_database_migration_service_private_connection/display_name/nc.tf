resource "google_compute_network" "network_nc" {
  name                    = "my-network-nc"
  auto_create_subnetworks = false
  project                 = "my-gcp-project-id"
}

resource "google_database_migration_service_private_connection" "nc" {
  # display_name intentionally omitted
  location              = "us-central1"
  private_connection_id = "noncompliant-display-name"
  project               = "your-gcp-project-id"

  vpc_peering_config {
    vpc_name = google_compute_network.network_nc.id
    subnet   = "10.0.0.0/29"
  }
}
