# Non-compliant play_integrity_config: token_ttl is not set

resource "firebase_app_check_play_integrity_config" "nc" {
  project    = "ankita-firebase-app-check-id" 
  app_id     = "1:1234567890:android:abcdef"
}