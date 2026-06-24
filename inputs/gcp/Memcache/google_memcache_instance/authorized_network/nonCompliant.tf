resource "google_memcache_instance" "non_compliant_example_1" {
    project        = "abc-12345678"
    name           = "nc1" 
    node_count     = 1

    node_config {
        cpu_count      = 1
        memory_size_mb = 1024
    }
}

resource "google_memcache_instance" "non_compliant_example_2" {
    project        = "abc-12345678"
    name           = "nc2" 
    node_count     = 1

    node_config {
        cpu_count      = 1
        memory_size_mb = 1024
    }
    
    authorized_network = "default"
}
