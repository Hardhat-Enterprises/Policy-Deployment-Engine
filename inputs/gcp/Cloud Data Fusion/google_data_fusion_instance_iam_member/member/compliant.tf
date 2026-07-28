resource "google_data_fusion_instance_iam_member" "compliant_example_1" {
  project = "gcp-project-12345"
  region  = "australia-southeast1"
  name    = "compliant_example_1"
  role    = "roles/datafusion.viewer"
  member  = "user:student@deakin.edu.au" 
}
