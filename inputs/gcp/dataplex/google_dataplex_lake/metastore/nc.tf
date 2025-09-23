resource "google_dataplex_lake" "nc" {
  name     = "lake-without-metastore"
  project  = var.project
  location = "us-central1"

  labels = {
    environment = "test"
    owner       = "dev-team"
  }

 
}
