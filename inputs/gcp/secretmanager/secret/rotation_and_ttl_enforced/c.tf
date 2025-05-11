# Describe your resource type here
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "google_pubsub_topic" "secret_rotation" {
  name    = "secret-rotation-topic"
  project = "premium-trainer-456719-j3"
}

resource "google_secret_manager_secret" "c_secret" {
  secret_id = "ttl-rotation-secret"
  project   = "premium-trainer-456719-j3"

  replication {
    auto {}
  }

  rotation {
    next_rotation_time = "2025-12-01T00:00:00Z"
    rotation_period    = "604800s" # 7 days
  }

  topics {
    name = google_pubsub_topic.secret_rotation.id
  }

  ttl = "3600s"
}
