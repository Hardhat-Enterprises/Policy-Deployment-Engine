resource "google_api_gateway_api" "nc" {
  provider = google-beta
  api_id   = "my-api-nc"
  project  = "reliable-alpha-478205-k9"
  labels = {
    environment = "production"
    owner       = "team-a"
  }
}