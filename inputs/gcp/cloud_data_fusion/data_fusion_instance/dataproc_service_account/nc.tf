resource "google_data_fusion_instance" "nc" {
  project = "gcp-project-12345"
  name   = "nc"
  region = "us-central1"
  type   = "BASIC"
  
  dataproc_service_account = "123456789-compute@developer.gserviceaccount.com"
}