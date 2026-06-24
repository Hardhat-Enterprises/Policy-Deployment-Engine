# application block

# checkout service

resource "google_apphub_service" "non_compliant_example_1" {
  project = "PDE"
  display_name = "AppHub Service nc1"
  location = "australia-southeast1"
  application_id = "online-shop-nc"
  service_id = "backend-nc"
  discovered_service = "atalog-service-path"
  attributes {}
}

resource "google_apphub_service" "non_compliant_example_2" {
  project = "PDE"
  display_name = "AppHub Service nc2"
  location = "australia-southeast1"
  application_id = "online-shop-nc"
  service_id = "backend-nc"
  discovered_service = "atalog-service-path"
}
