data "google_iam_policy" "nc1" {
  binding {
    role    = "roles/spanner.databaseReader"
    members = ["allUsers"]
  }
}

resource "google_spanner_database_iam_policy" "nc1" {
  instance    = "nc1"
  database    = "nc1"
  policy_data = data.google_iam_policy.nc1.policy_data
}
