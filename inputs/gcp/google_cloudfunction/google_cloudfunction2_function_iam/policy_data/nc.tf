resource "google_cloudfunctions2_function_iam_policy" "nc" {
  project        = "my-project"
  location       = "us-central1"
  cloud_function = "example_function.name"

  policy_data = jsonencode({
    bindings = [
      {
        role    = "roles/cloudfunctions.invoker"
        members = ["allUsers"]  # 🚨 Public access — triggers policy_data violation
      }
    ]
  })
}