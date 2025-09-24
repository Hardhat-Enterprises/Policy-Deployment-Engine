resource "google_memorystore_instance" "c" {
  project            = "test-project"
  instance_id        = "basic-instance-c"
  location           = "us-central1"
  shard_count        = 1
  node_type          = "REDIS_SHARED_CORE_NANO"
  replica_count      = 1
  deletion_protection_enabled = true
  authorization_mode = "AUTH_MODE_IAM_AUTH"
}
