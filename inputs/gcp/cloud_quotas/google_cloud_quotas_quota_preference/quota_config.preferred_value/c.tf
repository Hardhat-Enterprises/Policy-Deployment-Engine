resource "google_cloud_quotas_quota_preference" "c" {
  parent        = "projects/my-project-name"
  name = "c"
  service       = "compute.googleapis.com"
  quota_id = "c"
  contact_email = "testuser@gmail.com"

  dimensions = {
    region = "us-east1"
  }

  quota_config {
    preferred_value = 200
  }
}