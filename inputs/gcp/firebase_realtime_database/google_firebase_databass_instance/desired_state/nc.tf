resource "google_firebase_database_instance" "nc" {
    region = "us1"
    instance_id = "--rtdb-project-default-rtdb--"
    provider = google-beta
    project = "1"
    desired_state = "DISABLED"
  
}