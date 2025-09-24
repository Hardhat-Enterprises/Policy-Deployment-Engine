# Compliant recaptcha_v3_config: token_ttl is set

resource "google_firebase_app_check_recaptcha_v3_config" "c" {
  project    = "ankita-firebase-appcheck-id" 
  app_id        = "1:1234567890:android:abcdef"
  site_secret   = "6Lde3s4UAAAAABc1b2c3d4e5f6g7h8i9j0k1l2m"
  token_ttl     = "3600s"
}