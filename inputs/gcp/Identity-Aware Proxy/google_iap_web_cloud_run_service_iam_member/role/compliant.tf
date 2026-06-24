resource "google_iap_web_cloud_run_service_iam_member" "compliant_example_1" {
  project                = "c"
  location               = "us-central1"
  cloud_run_service_name = "my-cloud-run-service"
  role                   = "roles/iap.httpsResourceAccessor"  #  least privilege
  member                 = "user:jane@example.com"
}
