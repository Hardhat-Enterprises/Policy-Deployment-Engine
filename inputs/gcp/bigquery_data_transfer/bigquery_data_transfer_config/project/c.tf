variable "project_id" {
  description = "GCP Project ID"
  type        = string
  default     = "civil-lightning-468910-m1"
}

data "google_project" "project" {
  project_id = var.project_id
}

resource "google_project_iam_member" "permissions_C" {
  project = var.project_id
  role    = "roles/iam.serviceAccountTokenCreator"
  member  = "serviceAccount:service-${data.google_project.project.number}@gcp-sa-bigquerydatatransfer.iam.gserviceaccount.com"
}