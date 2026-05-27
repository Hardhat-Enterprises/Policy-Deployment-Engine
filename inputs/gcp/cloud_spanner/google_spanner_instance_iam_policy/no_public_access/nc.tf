resource "google_spanner_instance_iam_policy" "nc1" {
  instance    = "nc1"
  policy_data = "{\"bindings\": [{\"role\": \"roles/spanner.viewer\", \"members\": [\"allUsers\"]}]}"
  members     = ["allUsers"]
}
