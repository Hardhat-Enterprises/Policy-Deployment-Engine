resource "google_gke_backup_restore_plan_iam_binding" "nc" {
  name     = "rp-iam-nc"
  location = "australia-southeast1"
  project  = "PDE"
  role     = "roles/gkebackup.restoreViewer"

  members = [
    "user:user1@example.com",
    "user:user2@example.com",
    "user:user3@example.com",
    "user:user4@example.com",
    "user:user5@example.com",
    "user:user6@example.com",
    "user:user7@example.com",
    "user:user8@example.com",
    "user:user9@example.com",
    "user:user10@example.com",
    "user:user11@example.com" # 11 members, exceeding limit of 10
  ]
}
