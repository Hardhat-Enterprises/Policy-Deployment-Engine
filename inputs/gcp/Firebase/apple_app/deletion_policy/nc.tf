
resource "google_firebase_apple_app" "nc" {
    display_name = "testfirebaseappleapp-nc"
    bundle_id = "apple.app.12345"
    project = "1013881984426"
    
    deletion_policy = "ABANDON"
    provider = google-beta

}