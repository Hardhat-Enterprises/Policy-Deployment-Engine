# application block
resource "google_apphub_application" "application-nc" {
  project = "PDE"
  location = "australia-southeast1"
  application_id = "online-store-nc"
  scope {
    type = "REGIONAL"
  }
}

resource "google_compute_region_instance_group_manager" "mig" {
  name     = "mig-nc"
  project  = "PDE"
  region   = "australia-southeast1"
  version {
    instance_template = "template-path"
    name              = "primary"
  }
  base_instance_name = "vm"
  target_size        = 2
}

resource "google_apphub_workload" "nc1" {
  project = "PDE"
  display_name = "Workload nc1"
  location = "australia-southeast1"
  application_id = google_apphub_application.application-nc.application_id
  workload_id = google_compute_region_instance_group_manager.mig.name
  discovered_workload = "catalog-discovered-workload-path"

  attributes {}
}

resource "google_apphub_workload" "nc2" {
  project = "PDE"
  display_name = "Workload nc2"
  location = "australia-southeast1"
  application_id = google_apphub_application.application-nc.application_id
  workload_id = google_compute_region_instance_group_manager.mig.name
  discovered_workload = "catalog-discovered-workload-path"
}
