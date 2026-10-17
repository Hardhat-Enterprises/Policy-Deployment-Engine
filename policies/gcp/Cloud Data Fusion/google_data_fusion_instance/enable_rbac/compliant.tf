resource "google_data_fusion_instance" "compliant_example_1" {
  project = "gcp-project-12345"
  name        = "compliant_example_1"
  region      = "australia-southeast1"
  type        = "BASIC"
  enable_rbac = true
}
