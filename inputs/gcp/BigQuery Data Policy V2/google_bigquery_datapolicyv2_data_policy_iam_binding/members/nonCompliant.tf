resource "google_bigquery_datapolicyv2_data_policy_iam_binding" "non_compliant_example_1" {
  provider       = google-beta
  project        = "PDE"
  location       = "australia-southeast1"
  data_policy_id = "non_compliant_example_1"
  role           = "roles/bigquerydatapolicy.maskedReader"
  members = [
    "allAuthenticatedUsers"
  ]
}
