resource "google_cloud_quotas_quota_preference" "nc" {
  parent        = "projects/my-project-name"
  name = "nc"
  service       = "compute.googleapis.com"
  quota_id = "nc"
  contact_email = "testuser@gmail.com"

  dimensions = {
    region = "us-east1"
  }

  quota_config {
    preferred_value = 1000
  }
}