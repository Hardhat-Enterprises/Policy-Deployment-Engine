#This is the schema, or plan/model for the discovery engine.
#This is the most basic format it can take.

resource "google_discovery_engine_schema" "c" {
  project       = "735927692082"
  location      = "eu"
  data_store_id = "data-store-id"
  schema_id     = "c-schema-id"
  json_schema   = "{\"$schema\":\"https://google.com\",\"datetime_detection\":true,\"type\":\"object\",\"geolocation_detection\":true}"
}

#Patern Whitelist
