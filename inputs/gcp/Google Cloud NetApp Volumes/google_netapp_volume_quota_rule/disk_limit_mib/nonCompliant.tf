resource "google_netapp_volume_quota_rule" "non_compliant_example_1" {
  project       = "deakin-lab-123"
  name          = "non_compliant_example_1"
  location      = "australia-southeast2"
  volume_name   = "backup-volume"        # approved volume
  type          = "DEFAULT_USER_QUOTA"   # allowed type
  disk_limit_mib = 0                 # >= 1 GiB (example baseline)
}
