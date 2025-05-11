# Describe your resource type here
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "google_secret_manager_secret" "c_secret" {
  secret_id = "binary-safe-secret"
  project   = "premium-trainer-456719-j3"

  replication {
    auto {}
  }
}

resource "google_secret_manager_secret_version" "c" {
  secret                 = google_secret_manager_secret.c_secret.id
  secret_data            = "UG9saWN5IERldmVsb3BtZW50IEVuZ2luZQ=="
  is_secret_data_base64  = true
}
