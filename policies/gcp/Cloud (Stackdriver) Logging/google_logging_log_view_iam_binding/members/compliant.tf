resource "google_logging_log_view_iam_binding" "compliant_example_1" {
  parent  = "projects/my-project/locations/global/buckets/audit-bucket"
  bucket  = "buckets/audit-bucket"
  name    = "compliant_example_1"
  role    = "roles/logging.viewAccessor"
  members = ["serviceAccount:security-auditor@my-project.iam.gserviceaccount.com"]
}
