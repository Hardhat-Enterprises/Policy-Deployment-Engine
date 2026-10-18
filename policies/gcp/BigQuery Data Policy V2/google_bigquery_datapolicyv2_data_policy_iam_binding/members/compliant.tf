resource "google_bigquery_datapolicyv2_data_policy_iam_binding" "compliant_example_1" {
  project        = "PDE"
  location       = "australia-southeast1"
  data_policy_id = "compliant_example_1"
  role           = "roles/bigquerydatapolicy.maskedReader"
  members = [
    "group:data-readers@example.com"
  ]
}
