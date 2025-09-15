resource "google_memcache_instance" "c" {
    project        = "abc-12345678"
    name           = "c" 
    node_count     = 1

    node_config {
        cpu_count      = 1
        memory_size_mb = 1024
    }
    
    authorized_network = "google_service_networking_connection.private_service_connection.network"
}
