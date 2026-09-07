# Describe your resource type here
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant

# IAM Binding
resource "google_clouddeploy_delivery_pipeline_iam_binding" "non_compliant_example_1" {
  project  = "my-project"
  location = "us-central1"
  name     = "non_compliant_example_1"
  role     = "roles/editor"
  
  members = [
    "user:deploy-user@example.com",
  ]
}
