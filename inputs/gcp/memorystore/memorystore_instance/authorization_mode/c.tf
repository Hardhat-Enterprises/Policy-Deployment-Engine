resource "google_memorystore_instance" "c" {
  project            = "test-project"
  instance_id        = "basic-instance-c"
  location           = "us-central1"
  shard_count        = 1
  node_type          = "REDIS_SHARED_CORE_NANO"
  replica_count      = 1
  mode               = "CLUSTER"   # 如果你要用 cluster 模式
  authorization_mode = "AUTH_MODE_IAM_AUTH"
  zone_distribution_config {
    mode = "SINGLE_ZONE"
    zone = "us-central1-a"
  }
}