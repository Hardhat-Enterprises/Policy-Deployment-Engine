resource "google_memorystore_instance" "nc" {
  project            = "test-project"
  instance_id        = "basic-instance-nc"
  location           = "us-central1"
  shard_count        = 1
  node_type          = "REDIS_SHARED_CORE_NANO"
  replica_count      = 1
  mode               = "CLUSTER"
  authorization_mode = "AUTH_DISABLED"
  zone_distribution_config {
    mode = "SINGLE_ZONE"
    zone = "us-central1-a"
  }
}
