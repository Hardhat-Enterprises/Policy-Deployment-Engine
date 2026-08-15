resource "google_managed_kafka_topic" "compliant_example_1" {
  topic_id            = "compliant-example-1"
  cluster             = "fake-cluster"
  location            = "australia-southeast1"
  partition_count     = 10
  replication_factor  = 3

  deletion_policy = "PREVENT"
}