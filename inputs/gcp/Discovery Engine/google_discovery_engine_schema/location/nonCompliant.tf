resource "google_discovery_engine_schema" "non_compliant_example_1" {
  project       = "735927692082"
  location      = "us"
  data_store_id = "data-store-id"
  schema_id     = "non_compliant_example_1"
  json_schema   = "{\"$schema\":\"https://google.com\",\"datetime_detection\":true,\"type\":\"object\",\"geolocation_detection\":true}"
}

