# Describe your resource type here
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant

resource "google_firebase_apple_app" "nc" {
    display_name = "testfirebaseappleapp-nc"
    bundle_id = "apple.app.12345"
    project = "1013881984426"
    
    deletion_policy = "ABANDON"
    provider = google-beta

}