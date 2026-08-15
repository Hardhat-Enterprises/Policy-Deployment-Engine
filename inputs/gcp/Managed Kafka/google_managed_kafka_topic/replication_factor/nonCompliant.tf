resource "google_managed_kafka_topic" "non_compliant_example_1" {
  topic_id            = "non-compliant-example-1"
  cluster             = "fake-cluster"
  location            = "australia-southeast1"
  partition_count     = 10
  replication_factor  = 1
}