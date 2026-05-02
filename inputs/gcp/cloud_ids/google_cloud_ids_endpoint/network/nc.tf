resource "google_cloud_ids_endpoint" "nc" {
  name        = "nc"
  location    = "australia-southeast1"
  network     = "projects/my-project/global/networks/default"   
  severity    = "HIGH"
  description = "nc"
}