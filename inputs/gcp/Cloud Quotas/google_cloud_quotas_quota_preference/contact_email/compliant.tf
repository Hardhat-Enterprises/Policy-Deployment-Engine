resource "google_cloud_quotas_quota_preference" "compliant_example_1" {
  parent        = "projects/my-project-name"
  name = "compliant_example_1"
  service       = "compute.googleapis.com"
  quota_id = "compliant_example_1"
  contact_email = "admin@deakin.edu.au"

  dimensions = {
    region = "us-east1"
  }

  quota_config {
    preferred_value = 200
  }
}
