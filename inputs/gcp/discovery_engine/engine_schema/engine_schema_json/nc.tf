
resource "google_discovery_engine_schema" "nc" {
  project       = "735927692082"
  location      = "eu"
  data_store_id = "data-store-id"
  schema_id     = "nc"
  json_schema   = "{\"$schema\":\"https://json-schema.org/draft/2020-12/schema\",\"datetime_detection\":false,\"type\":\"object\",\"geolocation_detection\":false}"
}