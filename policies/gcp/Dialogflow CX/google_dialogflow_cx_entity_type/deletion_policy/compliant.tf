resource "google_dialogflow_cx_entity_type" "compliant_example_1" {
  parent          = "projects/example-project/locations/global/agents/00000000-0000-0000-0000-000000000000"
  display_name    = "compliant_example_1"
  kind            = "KIND_MAP"
  deletion_policy = "PREVENT"

  entities {
    value    = "example-value"
    synonyms = ["example-value"]
  }
}
