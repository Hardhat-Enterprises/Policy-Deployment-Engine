resource "google_logging_log_view_iam_binding" "non_compliant_example_1" {
  parent  = "projects/my-project/locations/global/buckets/audit-bucket"
  bucket  = "buckets/audit-bucket"
  name    = "non_compliant_example_1"
  role    = "roles/logging.logWriter"
  members = ["serviceAccount:security-auditor@my-project.iam.gserviceaccount.com"]
}
