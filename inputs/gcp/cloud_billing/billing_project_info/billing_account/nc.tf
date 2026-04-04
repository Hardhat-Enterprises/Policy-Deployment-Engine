# Describe your resource type here
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant


resource "google_billing_project_info" "default" {
  project         = google_project.project.project_id
  billing_account = ""
}