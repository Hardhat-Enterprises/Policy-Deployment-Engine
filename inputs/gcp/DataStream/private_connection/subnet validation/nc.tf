resource "google_datastream_private_connection" "nc" {
    display_name          = "Connection profile-nc"
    project = "your-gcp-project-id-nc"
    location              = "us-central1"
    private_connection_id = "my-connection"

    labels = {
        key = "value"
    }

    vpc_peering_config {
        vpc = google_compute_network.nc.id
        subnet = "10.0.0.0/8"
    }
}

resource "google_compute_network" "nc" {
  name = "my-network"
  project = "your-gcp-project-id-nc"
}