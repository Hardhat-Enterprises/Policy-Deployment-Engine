resource "google_discovery_engine_sitemap" "non_compliant_example_1" {
    data_store_id   = "non_compliant_example_1"
    location        = "eu"
    uri             = "https://www.google.com/sitemap.xml"
    project         = "capstone project"
    deletion_policy = "DELETE"
}