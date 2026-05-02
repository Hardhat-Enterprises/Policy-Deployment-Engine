resource "google_firebase_database_instance" "c" {
  region        = "australia-southeast1"
  instance_id   = "rtdb-project-default-rtdb"
  provider      = google-beta
  project       = "1"
  desired_state = "ACTIVE"

}


