resource "google_cloud_quotas_quota_preference" "non_compliant_example_1" {
  parent        = "projects/my-project-name"
  name = "non_compliant_example_1"
  service       = "compute.googleapis.com"
  quota_id = "non_compliant_example_1"
  contact_email = "testuser@gmail.com"

  ignore_safety_checks = "QUOTA_DECREASE_BELOW_USAGE"

  dimensions = {
    region = "us-east1"
  }

  quota_config {
    preferred_value = 200
  }
}
