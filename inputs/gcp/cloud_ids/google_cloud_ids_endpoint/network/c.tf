resource "google_cloud_ids_endpoint" "c" {
  name        = "ids-prod"
  location    = "australia-southeast1"
  network     = "projects/my-project/global/networks/private-vpc"   # ✅ safe
  severity    = "HIGH"
  description = "prod"
}