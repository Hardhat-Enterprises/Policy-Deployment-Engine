# Compliant: Uses viewAccessor only
resource "google_logging_log_view_iam_binding" "c" {
  parent = "projects/my-project/locations/global/buckets/audit-bucket"
  bucket = "buckets/audit-bucket"
  name   = "views/_Default"
  role   = "roles/logging.viewAccessor"

  members = [
    "serviceAccount:security-auditor@my-project.iam.gserviceaccount.com"
  ]
}

# Compliant: Another viewAccessor example
resource "google_logging_log_view_iam_binding" "c2" {
  parent = "projects/my-project/locations/global/buckets/audit-bucket"
  bucket = "buckets/audit-bucket"
  name   = "views/security-view"
  role   = "roles/logging.viewAccessor"

  members = [
    "user:security-team@example.com"
  ]
}