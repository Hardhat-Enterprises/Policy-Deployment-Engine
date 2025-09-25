resource "google_firebase_web_app" "c" {
    display_name = "testfirebasewebapp-c"
    project = "1013881984426"
    
    deletion_policy = "DELETE"
    provider = google-beta

}