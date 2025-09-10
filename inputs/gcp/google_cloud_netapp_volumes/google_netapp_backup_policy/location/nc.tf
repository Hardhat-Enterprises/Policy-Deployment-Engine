resource "google_netapp_backup_policy" "nc_test_backup_policy" {
  project       = "deakin-lab-123"
  name                = "nc1"
  location            = ""  # Melbourne
  daily_backup_limit  = 2
  weekly_backup_limit = 1
  monthly_backup_limit = 1
}
