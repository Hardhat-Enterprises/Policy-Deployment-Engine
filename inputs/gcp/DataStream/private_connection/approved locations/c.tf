resource "google_datastream_private_connection" "c" {
    display_name          = "Connection profile-c"
    project = "your-gcp-project-id-c"
    location              = "australia_southest1"
    private_connection_id = "my-connection"

    labels = {
        key = "value"
    }

    vpc_peering_config {
        vpc = google_compute_network.c.id
        subnet = "10.0.0.0/29"
    }

    create_without_validation = false
    
}

resource "google_compute_network" "c" {
  name = "my-network"
  project = "your-gcp-project-id-c"
}