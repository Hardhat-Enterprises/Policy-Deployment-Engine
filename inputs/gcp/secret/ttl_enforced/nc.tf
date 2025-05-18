# Describe your resource type here
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant

resource "google_secret_manager_secret" "nc" {
  project   = "premium-trainer-456719-j3"
  secret_id = "ttl-missing-secret"

  # No TTL provided = non-compliant

  replication {
    auto {}
  }
}

