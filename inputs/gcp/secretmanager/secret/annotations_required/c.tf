# Describe your resource type here
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "google_secret_manager_secret" "c" {
  secret_id = "annotated-secret"

  annotations = {
    created_by = "admin@example.com"
    env        = "production"
  }

  replication {
    auto {}
  }

  project = "premium-trainer-456719-j3"
}
