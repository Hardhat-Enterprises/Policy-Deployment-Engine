resource "google_discovery_engine_schema" "compliant_example_1" {
  project       = "735927692082"
  location      = "eu"
  data_store_id = "data-store-id"
  schema_id     = "compliant_example_1"
  json_schema   = "{\"$schema\":\"https://json-schema.org/draft/2020-12/schema\",\"datetime_detection\":true,\"type\":\"object\",\"geolocation_detection\":true}"
}
