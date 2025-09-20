resource "google_dataplex_lake" "ok" {
  project  = "dummy-project"
  name     = "lake-ok"
  location = "us-central1"

  labels = { owner = "pde" }
}
