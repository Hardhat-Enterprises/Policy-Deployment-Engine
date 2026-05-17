resource "google_logging_log_view_iam_binding" "c" {
  parent  = "projects/my-project/locations/global/buckets/audit-bucket"
  bucket  = "buckets/audit-bucket"
  name    = "c"
  role    = "roles/logging.viewAccessor"
  members = ["serviceAccount:security-auditor@my-project.iam.gserviceaccount.com"]
}