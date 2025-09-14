# Google Dataform Repository — compliant deletion_policy (disallow FORCE)

resource "google_dataform_repository" "c" {
  provider         = google-beta
  project          = var.project
  region           = "australia-southeast1"
  name             = "deletion-compliant"
  display_name     = "c"
  deletion_policy  = "DELETE"
}

