resource "google_dataplex_lake" "c" {
  name     = "lake-with-metastore"
  project  = var.project
  location = "us-central1"

  labels = {
    environment = "prod"
    owner       = "security-team"
  }

  metastore {
    service = "projects/my-project/locations/us-central1/services/my-metastore"
  }
}
