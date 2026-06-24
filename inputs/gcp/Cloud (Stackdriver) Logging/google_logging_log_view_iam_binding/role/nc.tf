resource "google_logging_log_view_iam_binding" "nc" {
  parent  = "projects/my-project/locations/global/buckets/audit-bucket"
  bucket  = "buckets/audit-bucket"
  name    = "nc"
  role    = "roles/logging.logWriter"
  members = ["serviceAccount:developer@my-project.iam.gserviceaccount.com"]
}