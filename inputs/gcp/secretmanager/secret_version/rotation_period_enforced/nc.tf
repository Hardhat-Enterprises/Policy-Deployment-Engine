# Describe your resource type here
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant

resource "google_secret_manager_secret" "nc_secret" {
  secret_id = "noncompliant-rotation-secret"
  project    = "premium-trainer-456719-j3"

  replication {
    auto {}
  }

  topics {
    name = google_pubsub_topic.secret_rotation.id
  }

}
