# Describe your resource type here
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "google_secret_manager_secret" "c_secret" {
  project    = "premium-trainer-456719-j3"
  secret_id  = "safe-secret"
  replication {
    auto {}
  }
}


resource "google_secret_manager_secret_version" "c" {
  secret          = google_secret_manager_secret.c_secret.id
  secret_data     = "safe-data"
  deletion_policy = "DISABLE"
}
