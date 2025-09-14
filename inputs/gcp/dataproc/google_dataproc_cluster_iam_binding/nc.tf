resource "google_dataproc_cluster_iam_binding" "nc" {
  project = "my-project-dataproc02"
  region  = "us-central1"
  cluster = "example-cluster-name"
  
  # VIOLATION: 'roles/editor' is a primitive role.
  role    = "roles/editor"
  
  members = [
    "user:test-user@example.com",
  ]
}