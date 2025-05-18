# Describe your resource type here
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant

resource "google_secret_manager_secret" "nc_secret" {
  secret_id = "public-secret"
  replication {
    auto {}
  }
  project = "premium-trainer-456719-j3"
}

resource "google_secret_manager_secret_iam_binding" "nc" {
  project   = google_secret_manager_secret.nc_secret.project
  secret_id = google_secret_manager_secret.nc_secret.secret_id
  role      = "roles/secretmanager.secretAccessor"

  members = [
    "user:aadi@gmail.com",
  ]
}
