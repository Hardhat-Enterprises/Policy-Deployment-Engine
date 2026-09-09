resource "google_beyondcorp_app_connector" "non_compliant_example_1" {
  name = "non_compliant_example_1"
  project = "smooth-verve-467716-v1"
  region  = "australia-southeast1"
  principal_info {
    service_account {
      email = "c-connector-sa@smooth-verve-467716-v1.iam.gserviceaccount.com"
    }
  }
}
