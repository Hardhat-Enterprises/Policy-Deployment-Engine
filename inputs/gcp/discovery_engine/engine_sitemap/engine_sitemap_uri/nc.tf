# Describe your resource type here

#engine_sitemap

resource "google_discovery_engine_sitemap" "nc" {
  project       = "735927692082"
  location      = "eu"
  data_store_id = "nc"
  uri           = "https://www.invaild.com/sitemap.xml"
}