resource "google_data_fusion_instance" "c" {
  project = "gcp-project-12345"
  name        = "c"
  region      = "australia-southeast1"
  type        = "BASIC"
  enable_rbac = true
}