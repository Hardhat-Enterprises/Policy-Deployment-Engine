# Describe your resource type here
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "google_redis_cluster" "c-1" {
  project        = "abc-12345678"
  name           = "compliant-redis-1" 
  region         = "us-central1"
  shard_count = 3 

  persistence_config {
    mode = "RDB"
    rdb_config {
      rdb_snapshot_period = "ONE_HOUR"
    }
  }
}

resource "google_redis_cluster" "c-2" {
  project        = "abc-12345678"
  name           = "compliant-redis-2" 
  region         = "us-central1"
  shard_count = 3 

  persistence_config {
    mode = "RDB"
    rdb_config {
      rdb_snapshot_period = "SIX_HOURS"
    }
  }
}

resource "google_redis_cluster" "c-3" {
  project        = "abc-12345678"
  name           = "compliant-redis-3" 
  region         = "us-central1"
  shard_count = 3 

  persistence_config {
    mode = "RDB"
    rdb_config {
      rdb_snapshot_period = "TWELVE_HOURS"
    }
  }
}

resource "google_redis_cluster" "c-4" {
  project        = "abc-12345678"
  name           = "compliant-redis-4" 
  region         = "us-central1"
  shard_count = 3 

  persistence_config {
    mode = "RDB"
    rdb_config {
      rdb_snapshot_period = "TWENTY_FOUR_HOURS"
    }
  }
}
