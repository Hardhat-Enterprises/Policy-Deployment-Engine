resource "google_dialogflow_cx_entity_type" "non_compliant_example_1" {
  parent       = "projects/example-project/locations/global/agents/00000000-0000-0000-0000-000000000000"
  display_name = "non_compliant_example_1"
  kind         = "KIND_MAP"
  redact       = false

  entities {
    value    = "example-value"
    synonyms = ["example-value"]
  }
}
