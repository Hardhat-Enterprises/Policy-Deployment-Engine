

resource "google_datastream_connection_profile" "nc" {
  project               = "your-gcp-project-id.nc"
  display_name          = "Connection profile-nc"
  location              = "australia-southeast1"
  connection_profile_id = "my-profile"
  create_without_validation = true

  gcs_profile {
    bucket    = "fake-bucket"
    root_path = "/some/path"
  }

  forward_ssh_connectivity {
    hostname = "google.com"
    username = "my-user"
    port     = 8022
    password = "file()"
  }
}
