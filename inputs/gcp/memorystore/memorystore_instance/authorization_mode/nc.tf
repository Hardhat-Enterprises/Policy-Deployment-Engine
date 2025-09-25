resource "google_memorystore_instance" "nc" {
  project            = "test-project"
  instance_id        = "basic-instance-c"
  location           = "us-central1"
  shard_count        = 1
  node_type          = "REDIS_SHARED_CORE_NANO"
  replica_count      = 1
  deletion_protection_enabled = false
  authorization_mode = "AUTH_DISABLED"
}
