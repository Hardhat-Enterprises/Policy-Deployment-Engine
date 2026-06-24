# application block

# checkout service

resource "google_apphub_service" "compliant_example_1" {
  project = "PDE"
  display_name = "AppHub Service c"
  location = "australia-southeast1"
  application_id = "online-shop-c"
  service_id = "backend-c"
  discovered_service = "catalog-discorvered-service-path"
  attributes {
    environment {
      type = "STAGING"
    }
    criticality {  
        type = "MISSION_CRITICAL"
    }
  }
}
