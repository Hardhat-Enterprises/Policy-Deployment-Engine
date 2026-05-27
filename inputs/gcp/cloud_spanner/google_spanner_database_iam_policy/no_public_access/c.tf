resource "google_spanner_database_iam_policy" "c1" {
  instance    = "c1"
  database    = "c1"
  policy_data = "{\"bindings\": [{\"role\": \"roles/spanner.databaseReader\", \"members\": [\"user:legitimate-user@example.com\"]}]}"
  members     = ["user:legitimate-user@example.com"]
}
