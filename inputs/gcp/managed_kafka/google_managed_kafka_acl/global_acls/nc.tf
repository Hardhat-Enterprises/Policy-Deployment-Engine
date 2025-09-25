# Describe your resource type here
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant

resource "google_managed_kafka_acl" "nc1" {
  acl_id   = "nc1"
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

resource "google_managed_kafka_acl" "nc2" {
  acl_id   = "nc2"
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
