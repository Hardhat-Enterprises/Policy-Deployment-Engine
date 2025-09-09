resource "google_memcache_instance" "nc-1" {
    project        = "abc-12345678"
    name           = "noncompliant-memcache-1" 
    node_count     = 1

    node_config {
        cpu_count      = 1
        memory_size_mb = 1024
    }

}

resource "google_memcache_instance" "nc-2" {
    project        = "abc-12345678"
    name           = "noncompliant-memcache-2" 
    node_count     = 1

    node_config {
        cpu_count      = 1
        memory_size_mb = 1024
    }

    reserved_ip_range_id = []
}