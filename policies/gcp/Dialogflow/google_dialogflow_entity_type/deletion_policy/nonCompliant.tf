resource "google_dialogflow_entity_type" "non_compliant_example_1" {
  display_name = "basic-entity-type"
  deletion_policy = "DELETE"
  project = "my_gcp_project"
  kind = "KIND_MAP"
  entities {
    value = "value1"
    synonyms = ["synonym1","synonym2"]
  }
  entities {
    value = "value2"
    synonyms = ["synonym3","synonym4"]
  }
}