# Describe your resource type here
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant

resource "google_managed_kafka_topic" "nc" {
  topic_id           = "insecure-topic"
  cluster            = "nc"
  location           = "us-central1"
  partition_count    = 1
  replication_factor = 1
  project = "123"

  configs = {
    "cleanup.policy"  = "compact"
    "retention.ms"    = "0" 
    "min.insync.replicas" = "1"
  }
}