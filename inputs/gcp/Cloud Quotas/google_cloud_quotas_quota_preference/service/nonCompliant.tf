resource "google_cloud_quotas_quota_preference" "non_compliant_example_1" {
  parent        = "projects/my-project-name"
  name = "nc"
  dimensions    = { region = "us-east1" }
  service       = "run.googleapis.com"
  quota_id = "non_compliant_example_1"
  contact_email = "testuser@gmail.com"
  quota_config  {
    preferred_value = 200
  }
}
