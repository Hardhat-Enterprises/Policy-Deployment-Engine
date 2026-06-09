resource "google_cloud_quotas_quota_adjuster_settings" "nc" {
  provider   = google-beta
  parent     = "projects/999999999999"
  enablement = "ENABLED"
}