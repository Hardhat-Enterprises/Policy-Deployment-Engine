resource "google_dataproc_autoscaling_policy_iam_binding" "c" {
  project   = "my-project-dataproc02" 
  location  = "us-central1"        
  policy_id = "dataproc-autoscaling-policy" 

  role = "roles/dataproc.autoscalingViewer"

  members = [
    "user:compliant-user@example.com",
  ]
}