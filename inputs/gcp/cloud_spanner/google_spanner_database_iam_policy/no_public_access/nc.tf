resource "google_spanner_database_iam_policy" "nc1" {
  instance    = "nc1"
  database    = "nc1"
  policy_data = "{\"bindings\": [{\"role\": \"roles/spanner.databaseReader\", \"members\": [\"allUsers\"]}]}"
  members     = ["allUsers"]
}
