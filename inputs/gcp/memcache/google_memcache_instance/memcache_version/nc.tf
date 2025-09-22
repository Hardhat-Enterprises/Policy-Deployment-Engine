resource "google_memcache_instance" "nc1" {
    project        = "abc-12345678"
    name           = "nc1" 
    node_count     = 1

    node_config {
        cpu_count      = 1
        memory_size_mb = 1024
    }  
}

resource "google_memcache_instance" "nc2" {
    project        = "abc-12345678"
    name           = "nc2" 
    node_count     = 1

    node_config {
        cpu_count      = 1
        memory_size_mb = 1024
    }  

    memcache_version = ""
}