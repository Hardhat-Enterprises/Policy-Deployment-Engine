resource "google_dataplex_lake" "ok" {
  project  = "dummy-project"
  name     = "lake-metastore-ok"
  location = "us-central1"

  metastore {
    service = "projects/dummy-project/locations/us-central1/services/dummy-metastore"
  }

  labels = { owner = "pde" }
}
