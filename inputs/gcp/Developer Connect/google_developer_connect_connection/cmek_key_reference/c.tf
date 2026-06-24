resource "google_developer_connect_connection" "c" {
  project       = "pde2025"
  location      = "australia-southeast1"
  connection_id = "c"

  github_config {
    github_app = "DEVELOPER_CONNECT"
  }

  crypto_key_config {
    key_reference = "projects/pde2025/locations/australia-southeast1/keyRings/devconnect/cryptoKeys/cmk-devconnect"
}
}