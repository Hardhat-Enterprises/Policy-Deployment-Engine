resource "google_cloudfunctions2_function_iam_policy" "c" {
  project        = "my-project"
  location       = "us-central1"
  cloud_function = "example_function.name"

  policy_data = jsonencode({
    bindings = [
      {
        role    = "roles/owner"  # 🚨 Overly permissive role
        members = ["user:admin@example.com"]
      }
    ]
  })
}
