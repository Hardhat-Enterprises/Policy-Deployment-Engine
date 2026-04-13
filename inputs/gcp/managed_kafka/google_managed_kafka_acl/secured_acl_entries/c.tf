resource "google_managed_kafka_acl" "c1" {
  acl_id   = "c1"
  cluster  = "projects/my-project/locations/australia-southeast2/clusters/example-cluster"
  location = "us-central1"
  project  = "123"

  acl_entries {
    principal       = "User:producer-client@my-project.iam.gserviceaccount.com"
    permission_type = "ALLOW"
    operation       = "WRITE"
    host            = "*"
  }
}

