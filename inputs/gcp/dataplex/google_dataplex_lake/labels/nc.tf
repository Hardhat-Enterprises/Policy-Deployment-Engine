resource "google_dataplex_lake" "bad" {
  project  = "dummy-project"
  name     = "lake-bad"
  location = "us-central1"

  labels = {}
}
