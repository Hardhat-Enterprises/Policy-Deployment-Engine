# Describe your resource type here
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant

resource "google_firebase_android_app" "nc" {
    display_name = "testfirebaseandroidapp-nc"
    package_name = "com.example.myapp"
    project = "1013881984426"
    
    deletion_policy = "ABANDON"
    provider = google-beta

}