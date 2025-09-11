# Describe your resource type here
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "google_managed_kafka_acl" "compliant_acl" {
  acl_id   = "compliant-acl"
  cluster  = "projects/my-project/locations/australia-southeast2/clusters/example-cluster"
  location = "us-central1"
  project  = "123"

  acl_entries {
    principal       = "User:producer-client@my-project.iam.gserviceaccount.com"  # Ensure principal is not a wildcard
    permission_type = "ALLOW"
    operation       = "WRITE"
    host            = "*"
  }
}

