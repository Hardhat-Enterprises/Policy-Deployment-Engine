# Describe your resource type here
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant

resource "google_secret_manager_secret" "nc_secret" {
  secret_id = "open-secret"
  project   = "premium-trainer-456719-j3"

  replication {
    auto {}
  }
}

resource "google_secret_manager_secret_iam_binding" "nc" {
  secret_id = google_secret_manager_secret.nc_secret.id
  project   = "premium-trainer-456719-j3"
  role      = "roles/secretmanager.secretAccessor"
  members   = ["user:policy@gmail.com"]

  condition {
    title       = "unrestricted_binding"
    description = "Binding lacks a valid expiration or restriction"
    expression  = "true"  # This is overly permissive
  }
}
