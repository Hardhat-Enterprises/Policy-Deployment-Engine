resource "google_memcache_instance" "compliant_example_1" {
  name                = "compliant-example-1"
  region              = "australia-southeast1"
  node_count          = 1
  authorized_network  = "projects/fake-project-id/global/networks/fake-network"

  node_config {
    cpu_count       = 1
    memory_size_mb  = 1024
  }
}