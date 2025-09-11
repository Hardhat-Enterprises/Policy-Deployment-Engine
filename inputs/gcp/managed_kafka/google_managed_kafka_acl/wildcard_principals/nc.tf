# Describe your resource type here
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant

resource "google_managed_kafka_acl" "non_compliant_acl" {
  acl_id   = "non-compliant-acl"
  cluster  = "projects/my-project/locations/australia-southeast2/clusters/example-cluster"
  location = "us-central1"
  project  = "123"

  acl_entries {
    principal       = "User:*"  
    permission_type = "ALLOW"
    operation       = "ALL"
    host            = "*"
  }
}
