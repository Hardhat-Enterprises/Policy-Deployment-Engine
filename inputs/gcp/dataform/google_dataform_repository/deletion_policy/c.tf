# Google Dataform Repository — compliant (deletion_policy: Safe deletion policy)

resource "google_dataform_repository" "c" {
  provider       = google-beta
  project        = var.project
  region         = "australia-southeast1"
  name           = "c"
  deletion_policy = "DELETE"
}

variable "project" {
  type = string
}

