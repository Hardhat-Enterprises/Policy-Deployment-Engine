resource "google_cloud_ids_endpoint" "c" {
  name              = "c"
  location          = "australia-southeast1"
  network           = "projects/my-project/global/networks/private-vpc"
  severity          = "HIGH"
  description       = "prod"
  threat_exceptions = ["safe-id"]   
}