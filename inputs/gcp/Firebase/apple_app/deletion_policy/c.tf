
resource "google_firebase_apple_app" "c" {
    display_name = "testfirebaseappleapp-c"
    bundle_id = "apple.app.12345"
    project = "1013881984426"
    
    deletion_policy = "DELETE"
    provider = google-beta

}
