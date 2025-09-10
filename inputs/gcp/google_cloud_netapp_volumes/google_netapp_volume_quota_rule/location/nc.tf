resource "google_netapp_volume_quota_rule" "nc_test_quota_rule" {
  project       = "deakin-lab-123"
  name          = "nc1"
  location      = "us-central1"
  volume_name   = "backup-volume"        # approved volume
  type          = "DEFAULT_USER_QUOTA"   # allowed type
  disk_limit_mib = 10240                 # >= 1 GiB (example baseline)
}
