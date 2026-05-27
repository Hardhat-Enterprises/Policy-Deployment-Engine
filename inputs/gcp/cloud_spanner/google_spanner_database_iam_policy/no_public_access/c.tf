data "google_iam_policy" "c1" {
  binding {
    role    = "roles/spanner.databaseReader"
    members = ["user:legitimate-user@example.com"]
  }
}

resource "google_spanner_database_iam_policy" "c1" {
  instance    = "c1"
  database    = "c1"
  policy_data = data.google_iam_policy.c1.policy_data
}
