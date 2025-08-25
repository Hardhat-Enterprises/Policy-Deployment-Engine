resource "google_iap_web_cloud_run_service_iam_member" "c_cr_role" {
  project                = "my-gcp-project"
  location               = "us-central1"
  cloud_run_service_name = "my-cloud-run-service"
  role                   = "roles/iap.httpsResourceAccessor"  #  least privilege
  member                 = "user:jane@example.com"
}
