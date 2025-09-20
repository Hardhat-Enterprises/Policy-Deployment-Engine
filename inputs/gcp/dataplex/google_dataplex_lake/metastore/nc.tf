resource "google_dataplex_lake" "bad" {
  project  = "dummy-project"
  name     = "lake-metastore-bad"
  location = "us-central1"

  labels = { owner = "pde" }
}
