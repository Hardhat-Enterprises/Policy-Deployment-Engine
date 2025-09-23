resource "google_memorystore_instance" "c" {
  project = "test-project"
  instance_id = "full-instance"
  shard_count = 1
  location = "us-central1"
  deletion_protection_enabled = true
}
