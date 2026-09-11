resource "google_data_fusion_instance" "non_compliant_example_1" {
  project = "gcp-project-12345"
  name   = "non_compliant_example_1"
  region = "australia-southeast1"
  type   = "BASIC"
  
  dataproc_service_account = "123456789-compute@developer.gserviceaccount.com"
}
