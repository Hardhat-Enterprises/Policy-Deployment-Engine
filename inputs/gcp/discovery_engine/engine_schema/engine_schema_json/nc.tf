
resource "google_discovery_engine_schema" "nc" {
  project       = "735927692082"
  location      = "us"
  data_store_id = "data-store-id"
  schema_id     = "nc"
  json_schema   = "{\"$schema\":\"https://json-schema.org/draft/2020-12/schema\",\"datetime_detection\":false,\"nottype\":\"notobject\",\"geolocation_detection\":false}"
}