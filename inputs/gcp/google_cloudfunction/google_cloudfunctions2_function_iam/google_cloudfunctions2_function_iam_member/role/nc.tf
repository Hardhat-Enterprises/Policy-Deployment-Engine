resource "google_cloudfunctions2_function_iam_member" "nc" {
  project        = "nc"
  location       = "us-central1"
  cloud_function = "google_cloudfunctions2_function_01"
  role           = "roles/owner"  # Overly permissive
  member         = "allUsers"   
}
