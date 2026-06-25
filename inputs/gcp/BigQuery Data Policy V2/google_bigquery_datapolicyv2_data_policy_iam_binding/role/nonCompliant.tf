resource "google_bigquery_datapolicyv2_data_policy_iam_binding" "non_compliant_example_1" {
  project        = "PDE"
  location       = "australia-southeast1"
  data_policy_id = "non_compliant_example_1"
  role           = "roles/bigquerydatapolicy.rawDataReader"
  members = [
    "group:data-readers@example.com"
  ]
}
