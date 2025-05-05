# Describe your resource type here
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant

resource "google_secret_manager_secret" "nc" {
  secret_id = "noncompliant-secret"
  replication {
    auto{}
  }
}