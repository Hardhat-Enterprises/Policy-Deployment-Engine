# application block
resource "google_apphub_application" "application-c" {
  project        = "PDE"
  location       = "australia-southeast1"
  application_id = "online-store-c"
  scope {
    type = "REGIONAL"
  }
}

resource "google_compute_region_instance_group_manager" "mig-c" {
  name    = "mig-c"
  project = "PDE"
  region  = "australia-southeast1"
  version {
    instance_template = "template-path"
    name              = "primary"
  }
  base_instance_name = "vm"
  target_size        = 2
}

resource "google_apphub_workload" "c" {
  project             = "PDE"
  display_name        = "AppHub Workload c"
  location            = "australia-southeast1"
  application_id      = google_apphub_application.application-nc.application_id
  workload_id         = google_compute_region_instance_group_manager.mig-c.name
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
