# Describe your resource type here
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "google_redis_instance" "c" {
    project        = "abc-12345678"
    name           = "compliant-redis" 
    tier           = "STANDARD_HA"
    memory_size_gb = 1
    region         = "us-central1"

    persistence_config {
        persistence_mode = "RDB"
        rdb_snapshot_period = "TWELVE_HOURS"
    }
}
