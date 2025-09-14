resource "google_dataproc_cluster_iam_binding" "c" {
  project = "my-project-dataproc02"
  region  = "us-central1"
  cluster = "example-cluster-name"
  
  # Compliant: Grants a specific, appropriate role.
  role    = "roles/dataproc.editor"
  
  members = [
    "user:test-user@example.com",
  ]
}