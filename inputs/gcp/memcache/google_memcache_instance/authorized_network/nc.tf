# Describe your resource type here
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant

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
    
    authorized_network = "default"
}
