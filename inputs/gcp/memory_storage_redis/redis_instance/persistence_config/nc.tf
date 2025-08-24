# Describe your resource type here
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant

resource "google_redis_instance" "nc-1" {
    project        = "abc-12345678"
    name           = "noncompliant-redis-1" 
    tier           = "STANDARD_HA"
    memory_size_gb = 1
    region         = "us-central1"
}

resource "google_redis_instance" "nc-2" {
    project        = "abc-12345678"
    name           = "noncompliant-redis-2" 
    tier           = "STANDARD_HA"
    memory_size_gb = 1
    region         = "us-central1"

    persistence_config {

    }
}

resource "google_redis_instance" "nc-3" {
    project        = "abc-12345678"
    name           = "noncompliant-redis-3" 
    tier           = "STANDARD_HA"
    memory_size_gb = 1
    region         = "us-central1"

    persistence_config {
        persistence_mode = "DISABLED"
        rdb_snapshot_period = ""
    }
}