
resource "google_discovery_engine_recommendation_engine" "c" {
  project       = "735927692082"
  engine_id                    = "c"
  location                     = google_discovery_engine_data_store.c.location
  display_name                 = "Example Recommendation Engine"
  data_store_ids               = [google_discovery_engine_data_store.c.data_store_id]


 }

 resource "google_discovery_engine_data_store" "c" {
  project                      = "735927692082"
  location                     = "eu"
  data_store_id                = "c-recommendation-datastore-id"
  display_name                 = "tf-test-structured-datastore"
  industry_vertical            = "GENERIC"
  content_config               = "NO_CONTENT"
}
#Note, it needed to link to a data store.