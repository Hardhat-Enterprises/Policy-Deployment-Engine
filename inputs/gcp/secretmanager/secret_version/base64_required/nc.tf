# Describe your resource type here
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant

resource "google_secret_manager_secret" "nc_secret" {
  secret_id = "binary-unsafe-secret"
  project   = "premium-trainer-456719-j3"

  replication {
    auto {}
  }
}

resource "google_secret_manager_secret_version" "nc" {
  secret                 = google_secret_manager_secret.nc_secret.id
  secret_data            = "binary-like-data"
  is_secret_data_base64  = false
}
