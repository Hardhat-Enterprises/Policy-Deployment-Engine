# Describe your resource type here
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "google_secret_manager_secret" "c" {
  secret_id = "monitored-secret"
  project   = "premium-trainer-456719-j3"

  replication {
    auto {}
  }

  topics {
    name = "projects/premium-trainer-456719-j3/topics/secret-monitoring"
  }
}
