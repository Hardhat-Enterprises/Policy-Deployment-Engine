resource "google_discovery_engine_sitemap" "compliant_example_1" {
    data_store_id = "compliant_example_1"
    location = "eu"
    uri = "https;//www.google.com/sitemap.xml"
    project = "capstone project"
    deletion_policy = "PREVENT"
}