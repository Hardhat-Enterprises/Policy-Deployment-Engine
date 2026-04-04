# Describe your resource type here
# Keep "c" as the name to indicate that this resource and its attributes are compliant


resource "google_billing_project_info" "default" {
  project         = google_project.project.project_id
  billing_account = "000000-0000000-0000000-000000"
}