# Describe your resource type here
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant


resource "google_redis_cluster" "nc" {
  project        = "abc-12345678"
  name           = "noncompliant-redis" 
  region         = "us-central1"
  shard_count = 3 

  deletion_protection_enabled = false
}

