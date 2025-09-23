# Non-compliant Realtime Database rules allowing open access
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant

resource "google_firebase_database_instance" "nc" {
  instance_id = "open-db"
  region      = "us-central1"
}


