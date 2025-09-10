resource "google_netapp_backup_policy" "c_test_backup_policy" {
  project       = "deakin-lab-123"
  name                = "c1"
  location            = "australia-southeast2"  # Melbourne
  daily_backup_limit  = 2
  weekly_backup_limit = 2
  monthly_backup_limit = 2
}
