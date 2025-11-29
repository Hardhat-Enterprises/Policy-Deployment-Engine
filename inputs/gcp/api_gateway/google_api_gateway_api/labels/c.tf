resource "google_api_gateway_api" "c" {
  provider = google-beta
  api_id = "my-api-c"
  project = "reliable-alpha-478205-k9"
  labels = {
    environment = "production"
    owner       = "team-a"
    sensitivity  = "restricted"
    cost_center = "cc-1234"
  }
}