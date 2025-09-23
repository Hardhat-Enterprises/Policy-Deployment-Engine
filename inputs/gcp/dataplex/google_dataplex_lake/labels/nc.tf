resource "google_dataplex_lake" "nc" {
  name     = "lake-noncompliant"
  project  = var.project
  location = "us-central1"

  
}
