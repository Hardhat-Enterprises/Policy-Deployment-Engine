# Describe your resource type here
# Keep "c" as the name to indicate that this resource and its attributes are compliant

# IAM Binding
resource "google_clouddeploy_target_iam_binding" "compliant_example_1" {
  project  = "my-project"
  location = "us-central1"
  name     = "compliant_example_1"
  role     = "roles/clouddeploy.operator"
  
  members = [
    "user:deploy-user@example.com",
  ]
}
