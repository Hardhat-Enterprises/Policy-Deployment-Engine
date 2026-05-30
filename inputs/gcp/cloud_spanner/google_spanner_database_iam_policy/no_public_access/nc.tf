data "google_iam_policy" "nc" {
  binding {
    role    = "roles/spanner.databaseReader"
    members = ["allUsers"]
  }
}

resource "google_spanner_database_iam_policy" "nc" {
  instance    = "nc"
  database    = "nc"
  policy_data = data.google_iam_policy.nc.policy_data
}
