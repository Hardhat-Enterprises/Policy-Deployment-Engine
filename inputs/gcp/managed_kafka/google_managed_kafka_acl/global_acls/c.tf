# Describe your resource type here
# Keep "c" as the name to indicate that this resource and its attributes are compliant

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

resource "google_managed_kafka_acl" "c2" {
  acl_id   = "c2"
  cluster  = "projects/my-project/locations/australia-southeast2/clusters/example-cluster"
  location = "us-central1"
  project  = "123"

  acl_entries {
    principal       = "User:consumer-app@my-project.iam.gserviceaccount.com"
    permission_type = "ALLOW"
    operation       = "READ"
    host            = "*"
  }
}

