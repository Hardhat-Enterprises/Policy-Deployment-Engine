resource "google_cloudfunctions2_function_iam_policy" "c" {
  project        = "c"
  location       = "us-central1"
  cloud_function = "example_function.name"

  policy_data = jsonencode({
    bindings = [
      {
        role    = "roles/owner"  
        members = ["user:admin@example.com"]
      }
    ]
  })
}
