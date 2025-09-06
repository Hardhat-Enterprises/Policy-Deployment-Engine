
resource "google_discovery_engine_schema" "nc" {
  project       = "735927692082"
  location      = "us"
  data_store_id = "data-store-id"
  schema_id     = "nc"
  json_schema   = "{\"$schema\":\"https://badexample.com\"}"
}