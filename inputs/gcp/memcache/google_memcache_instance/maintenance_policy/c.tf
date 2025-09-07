# Describe your resource type here
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "google_memcache_instance" "c" {
    project        = "abc-12345678"
    name           = "compliant-memcache" 
    node_count     = 1

    node_config {
        cpu_count      = 1
        memory_size_mb = 1024
    }
    
    maintenance_policy {
        weekly_maintenance_window {
          day = "MONDAY"
          duration = "14400s"
          start_time {
            hours   = 11
            minutes = 33
          }
        }
    }
}
