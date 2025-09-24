# token_ttl below minimum (20 minutes)

resource "google_firebase_app_check_app_attest_config" "nc" {
  app_id    = "projects/my-project-id/apps/1:1234567890:ios:abcdef123456"
  token_ttl = "0"  # 20 minutes, below 30 minutes minimum
  project    = "ankita-firebase-appcheck-id" 

}

