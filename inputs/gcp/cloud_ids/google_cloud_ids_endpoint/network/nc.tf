resource "google_cloud_ids_endpoint" "nc" {
  name        = "ids-test"
  location    = "australia-southeast1"
  network     = "projects/my-project/global/networks/default"   # ❌ unsafe
  severity    = "HIGH"
  description = "nc"
}