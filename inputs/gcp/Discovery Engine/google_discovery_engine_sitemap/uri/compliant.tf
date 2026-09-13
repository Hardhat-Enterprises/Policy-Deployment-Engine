resource "google_discovery_engine_sitemap" "compliant_example_1" {
    data_store_id = "compliant_example_1"
    location      = "eu"
    uri           = "https://www.example.com/sitemap.xml"
    project       = "capstone project"
}