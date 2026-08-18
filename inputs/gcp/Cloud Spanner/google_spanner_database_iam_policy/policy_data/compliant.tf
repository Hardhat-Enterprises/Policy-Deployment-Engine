data "google_iam_policy" "c" {
  binding {
    role    = "roles/spanner.databaseReader"
    members = ["user:legitimate-user@example.com"]
  }
}

resource "google_spanner_database_iam_policy" "compliant_example_1" {
  instance    = "c"
  database    = "compliant_example_1"
  policy_data = data.google_iam_policy.c.policy_data
}
