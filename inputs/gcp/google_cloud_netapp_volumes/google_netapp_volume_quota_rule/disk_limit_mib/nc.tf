resource "google_netapp_volume_quota_rule" "nc_test_quota_rule" {
  project       = "deakin-lab-123"
  name          = "nc1"
  location      = "australia-southeast2"
  volume_name   = "backup-volume"        # approved volume
  type          = "DEFAULT_USER_QUOTA"   # allowed type
  disk_limit_mib = 0                 # >= 1 GiB (example baseline)
}
