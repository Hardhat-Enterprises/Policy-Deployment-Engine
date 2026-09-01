resource "google_dialogflow_cx_playbook" "compliant_example_1" {
  parent          = "projects/example-project/locations/global/agents/00000000-0000-0000-0000-000000000000"
  display_name    = "compliant_example_1"
  goal            = "Assist the user with an example task."
  deletion_policy = "PREVENT"
}
