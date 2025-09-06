# Describe your resource type here
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant

resource "google_discovery_engine_recommendation_engine" "nc" {
  project                      = "735927692082"
  engine_id                    = "nc-recommendation-engine-id"
  location                     = google_discovery_engine_data_store.notcompliant.location
  display_name                 = "Example Recommendation Engine"
  data_store_ids               = [google_discovery_engine_data_store.notcompliant.data_store_id]
  industry_vertical            = "GENERIC"
  common_config {
    company_name               = "test-company"
  }
 }

 resource "google_discovery_engine_data_store" "notcompliant" {
  project                      = "735927692082"
  location                     = "global"
  data_store_id                = "nc-recommendation-datastore-id"
  display_name                 = "tf-test-structured-datastore"
  industry_vertical            = "GENERIC"
  content_config               = "NO_CONTENT"
  solution_types               = ["SOLUTION_TYPE_RECOMMENDATION"]
  create_advanced_site_search  = false
  skip_default_schema_creation = false
}
#Note, it needed to link to a data store.