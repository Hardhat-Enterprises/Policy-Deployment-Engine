# Compliant firebase_app_check_debug_token: has a display_name

resource "google_firebase_app_check_debug_token" "c" {
  project    = "ankita-firebase-appcheck-id" 
  app_id        = "1:1234567890:android:abcdef"
  display_name  = "compliant-debug-token"
  token         = "E9B3A4C6-1D0F-4B5A-8C3D-7E6F8A9B0C1D"
}