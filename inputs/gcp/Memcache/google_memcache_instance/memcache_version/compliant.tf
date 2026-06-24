resource "google_memcache_instance" "compliant_example_1" {
    project        = "abc-12345678"
    name           = "c1" 
    node_count     = 1

    node_config {
        cpu_count      = 1
        memory_size_mb = 1024
    }
    
    memcache_version = "MEMCACHE_1_5"
}

resource "google_memcache_instance" "compliant_example_2" {
    project        = "abc-12345678"
    name           = "c2" 
    node_count     = 1

    node_config {
        cpu_count      = 1
        memory_size_mb = 1024
    }
    
    memcache_version = "MEMCACHE_1_6_15"
}
