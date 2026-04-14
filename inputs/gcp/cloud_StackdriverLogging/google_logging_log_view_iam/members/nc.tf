# Non-compliant: Allows anyone on the internet
resource "google_logging_log_view_iam_binding" "nc" {
  parent = "projects/my-project/locations/global/buckets/audit-bucket"
  bucket = "buckets/audit-bucket"
  name   = "views/_Default"
  role   = "roles/logging.viewAccessor"

  members = [
    "allUsers"
  ]
}

# Non-compliant: Allows any authenticated Google user
resource "google_logging_log_view_iam_binding" "nc2" {
  parent = "projects/my-project/locations/global/buckets/audit-bucket"
  bucket = "buckets/audit-bucket"
  name   = "views/_Default"
  role   = "roles/logging.viewAccessor"

  members = [
    "allAuthenticatedUsers"
  ]
}

# Non-compliant: Mix of good and bad
resource "google_logging_log_view_iam_binding" "nc3" {
  parent = "projects/my-project/locations/global/buckets/audit-bucket"
  bucket = "buckets/audit-bucket"
  name   = "views/_Default"
  role   = "roles/logging.viewAccessor"

  members = [
    "serviceAccount:good@my-project.iam.gserviceaccount.com",
    "allUsers"
  ]
}