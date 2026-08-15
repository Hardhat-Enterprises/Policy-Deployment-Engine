resource "google_memcache_instance" "compliant_example_1" {
  name              = "compliant-example-1"
  region            = "australia-southeast1"
  node_count        = 1
  memcache_version  = "MEMCACHE_1_6_15"

  node_config {
    cpu_count       = 1
    memory_size_mb  = 1024
  }
}