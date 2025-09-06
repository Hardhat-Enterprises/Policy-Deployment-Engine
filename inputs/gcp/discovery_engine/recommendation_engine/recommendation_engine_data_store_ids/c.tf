# Describe your resource type here
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "google_discovery_engine_recommendation_engine" "c" {
  project       = "735927692082"
  engine_id                    = "c-recommendation-engine-id"
  location                     = google_discovery_engine_data_store.compliant.location
  display_name                 = "Example Recommendation Engine"
  data_store_ids               = [google_discovery_engine_data_store.compliant.data_store_id]
  industry_vertical            = "GENERIC"
  common_config {
    company_name               = "test-company"
  }
 }

 resource "google_discovery_engine_data_store" "compliant" {
  project       = "735927692082"
  location                     = "eu"
  data_store_id                = "c-recommendation-datastore-id"
  display_name                 = "tf-test-structured-datastore"
  industry_vertical            = "GENERIC"
  content_config               = "NO_CONTENT"
  solution_types               = ["SOLUTION_TYPE_RECOMMENDATION"]
  create_advanced_site_search  = false
  skip_default_schema_creation = false
}
#Note, it needed to link to a data store.