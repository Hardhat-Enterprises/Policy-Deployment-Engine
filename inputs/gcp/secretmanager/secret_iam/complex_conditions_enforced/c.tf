# Describe your resource type here
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "google_secret_manager_secret" "c_secret" {
  secret_id = "iam-safe-secret"
  project   = "premium-trainer-456719-j3" 

  replication {
    auto {}
  }
}

resource "google_secret_manager_secret_iam_binding" "c" {
  secret_id = google_secret_manager_secret.c_secret.secret_id
  role      = "roles/secretmanager.secretAccessor"
  members   = ["user:iam@gmail.com"]
}
