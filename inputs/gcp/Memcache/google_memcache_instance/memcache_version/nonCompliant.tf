resource "google_memcache_instance" "non_compliant_example_1" {
    project        = "abc-12345678"
    name           = "nc" 
    node_count     = 1

    node_config {
        cpu_count      = 1
        memory_size_mb = 1024
    }  

    memcache_version = ""
}
