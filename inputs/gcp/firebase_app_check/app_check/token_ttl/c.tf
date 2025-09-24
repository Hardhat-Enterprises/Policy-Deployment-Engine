# Compliant: token_ttl within allowed range (1 hour)
resource "google_firebase_app_check_app_attest_config" "c" {
  app_id    = "projects/my-project-id/apps/1:1234567890:ios:abcdef123456"
  token_ttl = "3600s"  # 1 hour
  project    = "ankita-firebase-appcheck-id" 
}
