resource "google_bigquery_datapolicyv2_data_policy_iam_binding" "c" {
  provider       = google-beta
  project        = "PDE"
  location       = "australia-southeast1"
  data_policy_id = "c"
  role           = "roles/bigquerydatapolicy.maskedReader"
  members = [
    "group:data-readers@example.com"
  ]
}
