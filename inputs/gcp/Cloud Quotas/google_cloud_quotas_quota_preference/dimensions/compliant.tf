resource "google_cloud_quotas_quota_preference" "compliant_example_1" {
  parent        = "projects/my-project-name"
  name = "compliant_example_1"
  dimensions    = { region = "australia-southeast1" }
  service       = "compute.googleapis.com"
  quota_id = "compliant_example_1"
  contact_email = "admin@deakin.edu.au"

  quota_config {
    preferred_value = 200
  }
}
