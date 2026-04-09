# Describe your resource type here
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "google_managed_kafka_topic" "c" {
  topic_id           = "secure-topic"
  cluster            = "c"
  location           = "us-central1"
  partition_count    = 3
  replication_factor = 3
  project = "123"

  configs = {
    "cleanup.policy"  = "delete"
    "retention.ms"    = "604800000" # 7 days
    "min.insync.replicas" = "2"
  }
}

