resource "google_memcache_instance" "c-1" {
    project        = "abc-12345678"
    name           = "compliant-memcache-1" 
    node_count     = 1

    node_config {
        cpu_count      = 1
        memory_size_mb = 1024
    }
    
    memcache_version = "MEMCACHE_1_5"
}

resource "google_memcache_instance" "c-2" {
    project        = "abc-12345678"
    name           = "compliant-memcache-2" 
    node_count     = 1

    node_config {
        cpu_count      = 1
        memory_size_mb = 1024
    }
    
    memcache_version = "MEMCACHE_1_6_15"
}
