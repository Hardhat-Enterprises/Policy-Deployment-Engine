#This is the schema, or plan/model for the discovery engine.
#This is the most basic format it can take.

resource "google_discovery_engine_schema" "nc" {
  project       = "735927692082"
  location      = "us"
  data_store_id = "data-store-id"
  schema_id     = "nc-schema-id"
  json_schema   = "{\"$schema\":\"https://badexample.com\"}"
}