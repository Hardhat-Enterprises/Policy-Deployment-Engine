# Describe your resource type here
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "google_datastream_connection_profile" "c" {
  project               = "your-gcp-project-id"
  display_name          = "Connection profile-c"
  location              = "AU"
  connection_profile_id = "my-profile"

  gcs_profile {
    bucket    = "fake-bucket"
    root_path = "/some/path"
  }

  forward_ssh_connectivity {
    hostname = "google.com"
    username = "my-user"
    port     = 8022
    password = file("ssh_password.rsa")
  }
}
