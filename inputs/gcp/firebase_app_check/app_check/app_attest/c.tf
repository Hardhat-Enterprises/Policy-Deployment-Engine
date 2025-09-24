# Compliant example: Firebase App Check App Attest is enforced

# Compliant Firebase App Check App Attest resource
resource "google_firebase_app_check_app_attest_config" "c" {
  app_id = "projects/my-project-id/apps/1:1234567890:ios:abcdef123456"
  project    = "ankita-firebase-appcheck-id" 
}

