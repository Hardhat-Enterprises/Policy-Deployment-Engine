resource "google_iap_web_cloud_run_service_iam_member" "nc1" {
  project                = "nc1"
  location               = "us-central1"
  cloud_run_service_name = "my-cloud-run-service"
  role                   = "roles/owner"        #  too broad
  member                 = "user:jane@example.com"
}

resource "google_iap_web_cloud_run_service_iam_member" "nc2" {
  project                = "nc2"
  location               = "us-central1"
  cloud_run_service_name = "my-cloud-run-service"
  role                   = "roles/editor"       #  too broad
  member                 = "user:jane@example.com"
}

resource "google_iap_web_cloud_run_service_iam_member" "nc3" {
  project                = "nc3"
  location               = "us-central1"
  cloud_run_service_name = "my-cloud-run-service"
  role                   = "roles/viewer"       #  not the accessor
  member                 = "user:jane@example.com"
}

resource "google_iap_web_cloud_run_service_iam_member" "nc4" {
  project                = "nc4"
  location               = "us-central1"
  cloud_run_service_name = "my-cloud-run-service"
  role                   = "roles/iap.admin"    #  admin, not accessor
  member                 = "user:jane@example.com"
}

resource "google_iap_web_cloud_run_service_iam_member" "nc5" {
  project                = "nc5"
  location               = "us-central1"
  cloud_run_service_name = "my-cloud-run-service"
  role                   = "roles/run.invoker"  #  wrong product role for IAP
  member                 = "user:jane@example.com"
}

resource "google_iap_web_cloud_run_service_iam_member" "nc6" {
  project                = "nc6"
  location               = "us-central1"
  cloud_run_service_name = "my-cloud-run-service"
  role                   = "projects/my-gcp-project/roles/CustomBroadRole"  #  custom broad
  member                 = "user:jane@example.com"
}
