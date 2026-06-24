resource "google_cloud_quotas_quota_preference" "nc" {
  parent        = "projects/my-project-name"
  name = "nc"
  dimensions    = { region = "us-east1" }
  service       = "compute.googleapis.com"
  quota_id = "nc"
  contact_email = "admin@deakin.edu.au"

  quota_config {
    preferred_value = 200
  }
}