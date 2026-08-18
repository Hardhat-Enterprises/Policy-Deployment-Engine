# This is NON-COMPLIANT because it uses 'allUsers'
resource "google_data_fusion_instance_iam_member" "non_compliant_example_1" {
  project = "hardhat-enterprises-123"
  region  = "australia-southeast1"
  name    = "non_compliant_example_1"
  role    = "roles/datafusion.viewer"
  member  = "allUsers"
}
