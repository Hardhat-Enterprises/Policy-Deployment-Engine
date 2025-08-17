# Describe your resource type here
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant


resource "google_redis_cluster" "nc-1" {
  project        = "abc-12345678"
  name           = "noncompliant-redis-1" 
  region         = "us-central1"
  shard_count = 3 
}

resource "google_redis_cluster" "nc-2" {
  project        = "abc-12345678"
  name           = "noncompliant-redis-2" 
  region         = "us-central1"
  shard_count = 3 

  authorization_mode = "AUTH_MODE_DISABLED"
}

