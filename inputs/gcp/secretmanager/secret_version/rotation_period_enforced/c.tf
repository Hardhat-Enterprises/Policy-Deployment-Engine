# Describe your resource type here
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "google_secret_manager_secret" "c_secret" {
  secret_id = "rotating-safe-secret"
  project   = "premium-trainer-456719-j3"

  replication {
    auto {}
  }

  rotation {
    next_rotation_time = "2025-12-01T00:00:00Z"
    rotation_period    = "604800s"
  }

  ttl = "86400s"
}
