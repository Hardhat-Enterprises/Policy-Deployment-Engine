# Non-compliant example: Firebase App Check App Attest is disabled



# project mismatch
resource "google_firebase_app_check_app_attest_config" "nc" {
  app_id = "projects/my-project-id/apps/1:2222222222:ios:wrongid"
  project    = "fake-firebase-appcheck-id"
}

