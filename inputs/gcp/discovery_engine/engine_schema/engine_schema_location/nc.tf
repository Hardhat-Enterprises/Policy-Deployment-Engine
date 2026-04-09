
resource "google_discovery_engine_schema" "nc" {
  project       = "735927692082"
  location      = "us"
  data_store_id = "data-store-id"
  schema_id     = "nc"
  json_schema   = "{\"$schema\":\"https://google.com\",\"datetime_detection\":true,\"type\":\"object\",\"geolocation_detection\":true}"
}

