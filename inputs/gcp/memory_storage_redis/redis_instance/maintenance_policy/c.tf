# Describe your resource type here
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "google_redis_instance" "c" {
    project        = "abc-12345678"
    name           = "compliant-redis" 
    tier           = "STANDARD_HA"
    memory_size_gb = 1
    region         = "us-central1"

    maintenance_policy {
        weekly_maintenance_window {
          day = "MONDAY"
          start_time {
            hours   = 11
            minutes = 33
          }
        }
    }
}
