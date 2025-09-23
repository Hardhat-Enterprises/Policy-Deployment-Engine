resource "google_dataplex_lake" "c" {
  name     = "lake-compliant"
  project  = var.project
  location = "us-central1"

  labels = {
    environment = "prod"
    owner       = "security-team"
  }
}
