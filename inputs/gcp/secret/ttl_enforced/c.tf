# Describe your resource type here
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "google_secret_manager_secret" "c" {
  project   = "premium-trainer-456719-j3"
  secret_id = "ttl-compliant-secret"

  ttl = "3600s" # 1 hour TTL

  replication {
    auto {}
  }
}
