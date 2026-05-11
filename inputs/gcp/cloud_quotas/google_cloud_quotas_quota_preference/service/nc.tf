resource "google_cloud_quotas_quota_preference" "nc" {
  parent        = "projects/my-project-name"
  name = "nc"
  dimensions    = { region = "us-east1" }
  service       = "run.googleapis.com"
  quota_id = "nc"
  contact_email = "testuser@gmail.com"
  quota_config  {
    preferred_value = 200
  }
}