# Describe your resource type here
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "google_firebase_apple_app" "c" {
    display_name = "testfirebaseappleapp-c"
    bundle_id = "apple.app.12345"
    project = "1013881984426"
    
    deletion_policy = "DELETE"
    provider = google-beta

}
