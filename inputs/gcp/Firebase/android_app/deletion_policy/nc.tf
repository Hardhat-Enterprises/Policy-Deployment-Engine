
resource "google_firebase_android_app" "nc" {
  display_name = "nc"
  package_name = "com.example.myapp"
  project      = "1013881984426"

  deletion_policy = "ABANDON"
  provider        = google-beta

}