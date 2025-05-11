# Describe your resource type here
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "google_secret_manager_secret" "c_secret" {
  secret_id             = "ttl-secret"
  project               = "premium-trainer-456719-j3"
  version_destroy_ttl   = "2592000s"  # 30 days

  replication {
    auto {}
  }
}

resource "google_secret_manager_secret_version" "c" {
  secret                 = google_secret_manager_secret.c_secret.id
  secret_data            = "YWFkaXR5YQ==" # base64 of "aaditya"
  is_secret_data_base64 = true
}
