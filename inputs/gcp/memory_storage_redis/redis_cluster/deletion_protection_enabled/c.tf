# Describe your resource type here
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "google_redis_cluster" "c1" {
  project        = "abc-12345678"
  name           = "c1" 
  region         = "us-central1"
  shard_count = 3 

  deletion_protection_enabled = true
}

resource "google_redis_cluster" "c2" {
  project        = "abc-12345678"
  name           = "c2" 
  region         = "us-central1"
  shard_count = 3 
}

