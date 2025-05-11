# Describe your resource type here
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant

resource "google_secret_manager_secret" "nc" {
  secret_id = "missing-annotations"

  annotations = {
    owner = "admin"
  }

  replication {
    auto {}
  }

  project = "premium-trainer-456719-j3"
}
