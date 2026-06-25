# Describe your resource type here

#engine_sitemap

resource "google_discovery_engine_sitemap" "non_compliant_example_1" {
  project					  = "735927692082"
  location                    = "eu"
  data_store_id               = "non_compliant_example_1"
  uri                         = "https://www.invaild.com/sitemap.xml"
}
