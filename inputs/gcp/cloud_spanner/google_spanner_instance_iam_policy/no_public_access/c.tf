resource "google_spanner_instance_iam_policy" "c1" {
  instance    = "c1"
  policy_data = "{\"bindings\": [{\"role\": \"roles/spanner.viewer\", \"members\": [\"user:legitimate-user@example.com\"]}]}"
  members     = ["user:legitimate-user@example.com"]
}
