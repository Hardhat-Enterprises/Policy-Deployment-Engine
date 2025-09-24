
resource "google_firebase_android_app" "c" {
  project    = "ankita-firebase-appcheck-id" 
  package_name = "com.example.app"
  display_name = "My Android App"
  sha1_hashes  = ["0123456789ABCDEF0123456789ABCDEF01234567"]
  sha256_hashes = ["0123456789ABCDEF0123456789ABCDEF0123456789ABCDEF0123456789ABCDEF"]
}