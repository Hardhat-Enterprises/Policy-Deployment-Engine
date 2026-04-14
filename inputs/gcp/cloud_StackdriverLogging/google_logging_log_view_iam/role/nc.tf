# Non-compliant: Uses logWriter (allows log modification)
resource "google_logging_log_view_iam_binding" "nc" {
  parent = "projects/my-project/locations/global/buckets/audit-bucket"
  bucket = "buckets/audit-bucket"
  name   = "views/_Default"
  role   = "roles/logging.logWriter"

  members = [
    "serviceAccount:developer@my-project.iam.gserviceaccount.com"
  ]
}

# Non-compliant: Uses privateLogViewer (may expose sensitive data)
resource "google_logging_log_view_iam_binding" "nc2" {
  parent = "projects/my-project/locations/global/buckets/audit-bucket"
  bucket = "buckets/audit-bucket"
  name   = "views/_Default"
  role   = "roles/logging.privateLogViewer"

  members = [
    "user:developer@example.com"
  ]
}

# Non-compliant: Custom role with excessive permissions
resource "google_logging_log_view_iam_binding" "nc3" {
  parent = "projects/my-project/locations/global/buckets/audit-bucket"
  bucket = "buckets/audit-bucket"
  name   = "views/_Default"
  role   = "projects/my-project/roles/custom_log_admin"

  members = [
    "serviceAccount:admin@my-project.iam.gserviceaccount.com"
  ]
}