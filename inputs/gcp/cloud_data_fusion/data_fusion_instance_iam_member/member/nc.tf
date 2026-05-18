# This is NON-COMPLIANT because it uses 'allUsers'
resource "google_data_fusion_instance_iam_member" "nc" {
  project = "hardhat-enterprises-123"
  region  = "australia-southeast1"
  name    = "nc"
  role    = "roles/datafusion.viewer"
  member  = "allUsers"
}