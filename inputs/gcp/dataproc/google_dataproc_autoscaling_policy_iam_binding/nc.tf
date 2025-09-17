resource "google_dataproc_autoscaling_policy_iam_binding" "nc" {
  project   = "my-project-dataproc02"
  location  = "us-central1" 
  policy_id = "dataproc-autoscaling-policy" 

  role = "roles/owner"

  members = [
    "user:non-compliant-user@example.com",
  ]
}