
resource "google_discovery_engine_recommendation_engine" "nc" {
  project                      = "735927692082"
  engine_id                    = "nc"
  location                     = google_discovery_engine_data_store.nc.location
  display_name                 = "Example Recommendation Engine"
  data_store_ids               = [google_discovery_engine_data_store.nc.data_store_id]
 }

 resource "google_discovery_engine_data_store" "nc" {
  project                      = "735927692082"
  location                     = "global"
  data_store_id                = "nc-recommendation-datastore-id"
  display_name                 = "tf-test-structured-datastore"
  industry_vertical            = "GENERIC"
  content_config               = "NO_CONTENT"

}
#Note, it needed to link to a data store.