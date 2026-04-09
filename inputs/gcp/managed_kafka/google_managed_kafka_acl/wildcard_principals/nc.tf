# Describe your resource type here
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant

resource "google_managed_kafka_acl" "nc" {
  acl_id   = "non-compliant-acl"
  cluster  = "nc"
  location = "us-central1"
  project  = "123"

  acl_entries {
    principal       = "User:*"  
    permission_type = "ALLOW"
    operation       = "ALL"
    host            = "*"
  }
}
