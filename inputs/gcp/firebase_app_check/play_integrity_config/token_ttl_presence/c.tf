# Compliant play_integrity_config: token_ttl is set

resource "firebase_app_check_play_integrity_config" "c" {
  project    = "ankita-firebase-appcheck-id" 
  app_id     = "1:1234567890:android:abcdef"
  token_ttl  = "3600s"
}