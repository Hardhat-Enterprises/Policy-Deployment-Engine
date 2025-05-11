# Describe your resource type here
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "google_secret_manager_secret" "c_secret" {
  secret_id = "secure-secret"
  replication {
    auto {}
  }
  project = "premium-trainer-456719-j3"
}

resource "google_secret_manager_secret_iam_binding" "c" {
  project   = google_secret_manager_secret.c_secret.project
  secret_id = google_secret_manager_secret.c_secret.secret_id
  role      = "roles/secretmanager.secretAccessor"

  members = [
    "user:aaditya@gmail.com",
  ]

  condition {
    title       = "access_expiry"
    description = "Access expires in 2026"
    expression  = "request.time < timestamp(\"2026-01-01T00:00:00Z\")"
  }
}
