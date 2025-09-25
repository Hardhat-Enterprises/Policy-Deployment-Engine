# Describe your resource type here
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant


resource "google_redis_instance" "nc" {
  project        = "abc-12345678"
  name           = "nc"
  tier           = "STANDARD_HA"
  memory_size_gb = 1
  region         = "us-central1"

  auth_enabled = false
}
