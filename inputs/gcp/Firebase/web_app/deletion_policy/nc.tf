resource "google_firebase_web_app" "nc" {
    display_name = "nc"
    project = "1013881984426"
    
    deletion_policy = "ABANDON"
    provider = google-beta
}