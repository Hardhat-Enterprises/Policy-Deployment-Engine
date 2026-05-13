resource "google_bigquery_datapolicyv2_data_policy_iam_binding" "nc" {
  provider       = google-beta
  project        = "PDE"
  location       = "australia-southeast1"
  data_policy_id = "nc"
  role           = "roles/bigquerydatapolicy.rawDataReader"
  members = [
    "group:data-readers@example.com"
  ]
}
