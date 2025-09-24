
resource "google_firebase_android_app" "nc" {
  project    = "ankita-firebase-appcheck-id" 
  package_name = "com.example.noncompliant"
  display_name = "Non-Compliant Android App"
  sha1_hashes  = ["0123456789ABCDEF0123456789ABCDEF01234567"]
  sha256_hashes = []
}