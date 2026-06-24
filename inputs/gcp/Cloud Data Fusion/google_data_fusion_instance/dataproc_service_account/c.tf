resource "google_data_fusion_instance" "c" {
  project = "gcp-project-12345"
  name   = "c"
  region = "australia-southeast1"
  type   = "BASIC"
  
  dataproc_service_account = "cdf-runner@hardhat-prod-project.iam.gserviceaccount.com"
}