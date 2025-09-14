
resource "google_cloudfunctions2_function_iam_member" "c" {
  project        = "c"
  location       = "us-central1"
  cloud_function = "google_cloudfunctions2_function_01"
  role           = "roles/cloudfunctions.invoker"
  member         = "serviceAccount:my-invoker@my-project.iam.gserviceaccount.com"  # Compliant
}

