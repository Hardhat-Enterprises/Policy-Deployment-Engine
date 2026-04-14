resource "google_cloud_ids_endpoint" "nc" {
  project  = "test-project"

  name     = "ids-test"
  location = "europe-west1"  

  network  = "projects/test-project/global/networks/private-vpc"
  severity = "HIGH"

  description = "nc"
}