resource "google_netapp_backup_policy" "non_compliant_example_1" {
  project       = "deakin-lab-123"
  name                = "non_compliant_example_1"
  location            = "australia-southeast2"  # Melbourne
  daily_backup_limit  = 1
  weekly_backup_limit = 2
  monthly_backup_limit = 2
}
