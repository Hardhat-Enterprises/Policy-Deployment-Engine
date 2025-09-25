resource "google_firestore_backup_schedule" "c" {
  project  = "my-project-name"
  retention = "8467200s" // 14 weeks (maximum possible retention)

  weekly_recurrence {
     day = "MONDAY"  # ✅ 合规
  }
}