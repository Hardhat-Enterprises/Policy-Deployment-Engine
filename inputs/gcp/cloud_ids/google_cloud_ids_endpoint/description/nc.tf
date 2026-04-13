resource "google_cloud_ids_endpoint" "nc" {
  name        = "ids-test"
  location    = "australia-southeast1"
  network     = "projects/my-project/global/networks/private-vpc"
  severity    = "HIGH"
  description = "nc"   # ❌ fail
}
