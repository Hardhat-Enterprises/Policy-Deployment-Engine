# Describe your resource type here
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "google_secret_manager_secret" "c_secret" {
  secret_id = "restricted-secret"
  replication { auto {} }
  project     = "premium-trainer-456719-j3"
}

resource "google_secret_manager_secret_iam_binding" "c" {
  secret_id = google_secret_manager_secret.c_secret.id
  project   = "premium-trainer-456719-j3"
  role      = "roles/secretmanager.secretAccessor"
  members   = ["user:jane@example.com"]

  condition {
    title       = "expiring_access"
    description = "Only valid weekdays before June"
    expression  = "request.time < timestamp(\"2025-06-01T00:00:00Z\") && request.time.getDayOfWeek() >= 1 && request.time.getDayOfWeek() <= 5"
  }
}
