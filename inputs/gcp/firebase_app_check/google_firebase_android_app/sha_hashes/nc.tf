# google_firebase_android_app
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant
resource "google_firebase_android_app" "nc" {
  display_name = "non-compliant-app"
  package_name = "com.example.noncompliant"
}
