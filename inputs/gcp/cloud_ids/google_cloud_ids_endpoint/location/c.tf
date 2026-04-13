resource "google_cloud_ids_endpoint" "c" {
  project  = "test-project"

  name     = "ids-prod"
  location = "australia-southeast1"   # ✅ correct

  network  = "projects/test-project/global/networks/private-vpc"
  severity = "HIGH"

  description = "c"
}