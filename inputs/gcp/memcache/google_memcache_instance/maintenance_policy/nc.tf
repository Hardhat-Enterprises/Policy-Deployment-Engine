# Describe your resource type here
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant

resource "google_memcache_instance" "nc" {
    project        = "abc-12345678"
    name           = "noncompliant-memcache" 
    node_count     = 1

    node_config {
        cpu_count      = 1
        memory_size_mb = 1024
    }
    
}