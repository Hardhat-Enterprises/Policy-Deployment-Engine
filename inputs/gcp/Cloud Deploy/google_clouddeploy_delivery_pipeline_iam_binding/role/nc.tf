# Describe your resource type here
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant

# IAM Binding
resource "google_clouddeploy_delivery_pipeline_iam_binding" "nc" {
  project  = "my-project"
  location = "us-central1"
  name     = "nc"
  role     = "roles/editor"
  
  members = [
    "user:admin-user@example.com",
  ]
}