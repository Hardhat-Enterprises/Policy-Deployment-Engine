# google_firebase_android_app
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant
resource "google_firebase_android_app" "nc" {
  display_name = "non-compliant-app"
  package_name = "com.example.noncompliant"
  sha1_hashes    = ["A1:B2:C3:D4:E5:F6:A1:B2:C3:D4:E5:F6:A1:B2:C3:D4:E5:F6:A1:B2"]
}
