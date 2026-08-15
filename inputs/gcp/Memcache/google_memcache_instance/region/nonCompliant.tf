resource "google_memcache_instance" "non_compliant_example_1" {
  name       = "non-compliant-example-1"
  region     = "us-central1"
  node_count = 1

  node_config {
    cpu_count       = 1
    memory_size_mb  = 1024
  }
}