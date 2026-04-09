# Describe your resource type here
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant

resource "google_managed_kafka_acl" "nc1" {
  acl_id   = "allTopics"
  cluster  = "nc1"
  location = "us-central1"
  project  = "123"

  acl_entries {
    principal       = "User:*"
    permission_type = "ALLOW"
    operation       = "ALL"
    host            = "*"
  }
}

resource "google_managed_kafka_acl" "nc2" {
  acl_id   = "allConsumerGroups"
  cluster  = "nc2"
  location = "us-central1"
  project  = "123"

  acl_entries {
    principal       = "User:*"
    permission_type = "ALLOW"
    operation       = "ALL"
    host            = "*"
  }
}
