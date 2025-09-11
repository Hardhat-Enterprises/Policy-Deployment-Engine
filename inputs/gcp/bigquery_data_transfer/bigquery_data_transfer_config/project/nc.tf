resource "google_project_iam_member" "nc" {
  project = "civil-lightning-468910-m1"  
  role    = "roles/iam.serviceAccountTokenCreator"

  member  = "serviceAccount:service-123456789012@gcp-sa-bigquerydatatransfer.iam.gserviceaccount.com"
}