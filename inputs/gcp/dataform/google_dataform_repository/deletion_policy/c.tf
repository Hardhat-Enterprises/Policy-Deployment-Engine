# Google Dataform Repository — compliant deletion_policy (disallow FORCE)

resource "google_dataform_repository" "c" {
  provider        = google-beta
  region          = "australia-southeast1"
  name            = "c"
  display_name    = "c"
  deletion_policy = "DELETE"
}
