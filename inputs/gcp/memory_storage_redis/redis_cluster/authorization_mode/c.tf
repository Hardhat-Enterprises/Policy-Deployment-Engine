# Describe your resource type here
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "google_redis_cluster" "c" {
  project        = "abc-12345678"
  name           = "compliant-redis" 
  region         = "us-central1"
  shard_count = 3 

  authorization_mode = "AUTH_MODE_IAM_AUTH"
}

