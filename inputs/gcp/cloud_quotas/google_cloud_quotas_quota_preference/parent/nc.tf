resource "google_cloud_quotas_quota_preference" "nc" {
  parent        = "projects/not-approved-project"
  name          = "compute_googleapis_com-CPUS-per-project_us-east1"
  service       = "compute.googleapis.com"
  quota_id      = "CPUS-per-project-region"
  contact_email = "testuser@gmail.com"

  dimensions = {
    region = "us-east1"
  }

  quota_config {
    preferred_value = 200
  }
}