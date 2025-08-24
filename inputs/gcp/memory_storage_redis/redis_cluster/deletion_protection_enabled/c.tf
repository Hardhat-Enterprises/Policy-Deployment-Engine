# Describe your resource type here
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "google_redis_cluster" "c-1" {
  project        = "abc-12345678"
  name           = "compliant-redis-1" 
  region         = "us-central1"
  shard_count = 3 

  deletion_protection_enabled = true
}

resource "google_redis_cluster" "c-2" {
  project        = "abc-12345678"
  name           = "compliant-redis-2" 
  region         = "us-central1"
  shard_count = 3 
}

