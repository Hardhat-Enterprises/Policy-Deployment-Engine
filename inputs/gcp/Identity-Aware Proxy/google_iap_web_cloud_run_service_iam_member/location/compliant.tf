resource "google_iap_web_cloud_run_service_iam_member" "compliant_example_1" {
  project                = "c"
  location               = "australia-southeast1"
  cloud_run_service_name = "orders-be-prod"
  role                   = "roles/iap.httpsResourceAccessor"
  member                 = "user:jane@example.com"
}
