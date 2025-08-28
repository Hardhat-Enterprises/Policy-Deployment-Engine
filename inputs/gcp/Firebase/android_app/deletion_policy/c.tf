# Describe your resource type here
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "google_firebase_android_app" "c" {
    display_name = "testfirebaseandroidapp-c"
    package_name = "com.example.myapp"
    project = "1013881984426"
    
    deletion_policy = "DELETE"
    provider = google-beta

}