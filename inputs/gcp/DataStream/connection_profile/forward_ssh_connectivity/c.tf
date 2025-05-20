
resource "google_datastream_connection_profile" "c" {
  project               = "your-gcp-project-id.c"
  display_name          = "Connection profile-c"
  location              = "australia-southeast1"
  connection_profile_id = "my-profile"

  gcs_profile {
    bucket    = "fake-bucket"
    root_path = "/some/path"
  }

  forward_ssh_connectivity {
    hostname = "google.com"
    username = "my-user"
    port     = 8022
    password = "/secrets/ssh/ssh_password.rsa"
  }
}
