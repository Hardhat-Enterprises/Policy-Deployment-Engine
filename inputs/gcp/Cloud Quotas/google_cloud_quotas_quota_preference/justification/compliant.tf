resource "google_cloud_quotas_quota_preference" "compliant_example_1" {
  parent        = "projects/my-project-name"
  name = "c"
  service       = "compute.googleapis.com"
  quota_id = "compliant_example_1"
  contact_email = "admin@deakin.edu.au"
  justification = "Required for approved academic workload"

  dimensions = {
    region = "us-east1"
  }

  quota_config {
    preferred_value = 200
  }
}
