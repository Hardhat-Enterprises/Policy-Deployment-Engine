resource "google_firestore_backup_schedule" "nc" {
  project  = "nc"
  retention = "8467200s"
  weekly_recurrence {
    day = "FRIDAY"  # ❌ 不合规（不是 MONDAY）
  }
}
