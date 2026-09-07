# application block

# checkout service

resource "google_apphub_service" "non_compliant_example_1" {
  project = "PDE"
  display_name = "AppHub Service c"
  location = "australia-southeast1"
  application_id = "online-shop-c"
  service_id = "backend-c"
  discovered_service = "catalog-discorvered-service-path"
  attributes {}
}

resource "google_apphub_service" "non_compliant_example_2" {
  project = "PDE"
  display_name = "AppHub Service c"
  location = "australia-southeast1"
  application_id = "online-shop-c"
  service_id = "backend-c"
  discovered_service = "catalog-discorvered-service-path"
}
