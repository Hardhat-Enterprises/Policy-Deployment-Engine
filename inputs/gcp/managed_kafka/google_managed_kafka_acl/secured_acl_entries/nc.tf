resource "google_managed_kafka_acl" "nc1" {
  acl_id   = "nc1"
  cluster  = "nc1"
  location = "us-central1"
  project = "123"
  
  acl_entries {
    principal       = "User:producer-client@my-project.iam.gserviceaccount.com"
    permission_type = "DENY"
    operation       = "ALL"
    host            = "*"
  }
}

