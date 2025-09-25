# Describe your resource type here
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "google_redis_cluster" "c1" {
  project        = "abc-12345678"
  name           = "c1" 
  region         = "us-central1"
  shard_count = 3 

  persistence_config {
    mode = "RDB"
    rdb_config {
      rdb_snapshot_period = "ONE_HOUR"
    }
  }
}

resource "google_redis_cluster" "c2" {
  project        = "abc-12345678"
  name           = "c2" 
  region         = "us-central1"
  shard_count = 3 

  persistence_config {
    mode = "RDB"
    rdb_config {
      rdb_snapshot_period = "SIX_HOURS"
    }
  }
}

resource "google_redis_cluster" "c3" {
  project        = "abc-12345678"
  name           = "c3" 
  region         = "us-central1"
  shard_count = 3 

  persistence_config {
    mode = "RDB"
    rdb_config {
      rdb_snapshot_period = "TWELVE_HOURS"
    }
  }
}

resource "google_redis_cluster" "c4" {
  project        = "abc-12345678"
  name           = "c4" 
  region         = "us-central1"
  shard_count = 3 

  persistence_config {
    mode = "RDB"
    rdb_config {
      rdb_snapshot_period = "TWENTY_FOUR_HOURS"
    }
  }
}
