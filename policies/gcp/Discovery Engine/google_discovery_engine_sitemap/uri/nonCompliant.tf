resource "google_discovery_engine_sitemap" "non_compliant_example_1" {
    data_store_id = "non_compliant_example_1"
    location      = "eu"
    uri           = "http://example.com"
    project       = "capstone project"
}
