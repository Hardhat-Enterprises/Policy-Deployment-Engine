data "google_iam_policy" "nc" {
  binding {
    role    = "roles/spanner.databaseReader"
    members = ["allUsers"]
  }
}

resource "google_spanner_database_iam_policy" "non_compliant_example_1" {
  instance    = "nc"
  database    = "non_compliant_example_1"
  policy_data = data.google_iam_policy.nc.policy_data
}
