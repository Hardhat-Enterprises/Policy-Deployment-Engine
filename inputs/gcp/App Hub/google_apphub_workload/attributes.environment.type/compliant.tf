# application block

resource "google_apphub_workload" "compliant_example_1" {
  project = "PDE"
  display_name = "AppHub Workload c"
  location = "australia-southeast1"
  application_id = "online-store-c"
  workload_id = "mig-c"
  discovered_workload = "catalog-discovered-workload-path"
  attributes {
    environment {
      type = "STAGING"
    }
    criticality {  
        type = "MISSION_CRITICAL"
    }
  }
}
