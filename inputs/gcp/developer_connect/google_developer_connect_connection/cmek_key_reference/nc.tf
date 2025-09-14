resource "google_developer_connect_connection" "nc" {
  project       = "pde2025"
  location      = "australia-southeast1"
  connection_id = "nc"

  github_config {
    github_app = "DEVELOPER_CONNECT"
  }

  crypto_key_config {
    key_reference = "projects/otherproj/locations/us-central1/keyRings/other/cryptoKeys/not-allowed"
  }
}
