# Google Dataform Repository — compliant (labels: All required labels present)

resource "google_dataform_repository" "c" {
  provider = google-beta
  project  = var.project
  region   = "australia-southeast1"
  name     = "c"
  
  labels = {
    environment  = "production"
    owner        = "team-data"
    cost_center  = "engineering"
    team         = "data-engineering"
  }
}

variable "project" {
  type = string
}

