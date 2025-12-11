resource "google_api_gateway_api" "c" {
  provider = google-beta
  api_id   = "c"
  project  = "reliable-alpha-478205-k9"
  labels = {
    environment = "production"
    owner       = "team-a"
    sensitivity = "restricted"
    cost_center = "ENG-001"
  }
}