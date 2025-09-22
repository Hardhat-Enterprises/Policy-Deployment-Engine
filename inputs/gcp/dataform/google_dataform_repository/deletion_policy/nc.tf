# Google Dataform Repository — non-compliant deletion_policy (disallow FORCE)

resource "google_dataform_repository" "nc" {
  provider      = google-beta
  project       = var.project
  region        = "australia-southeast1"
  name          = "nc"
  display_name  = "nc"
  deletion_policy = "FORCE"
}
