# application block
resource "google_apphub_application" "application-nc" {
  project = "PDE"
  location = "us-central1"
  application_id = "online-shop-1"
  scope {
    type = "REGIONAL"
  }
}

resource "google_compute_region_instance_group_manager" "mig" {
  name     = "l7-ilb-mig1"
  project  = "PDE"
  region   = "us-central1"
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
  location = "us-central1"
  application_id = google_apphub_application.application-nc.application_id
  workload_id = google_compute_region_instance_group_manager.mig.name
  discovered_workload = "catalog-discovered-workload-path"

  attributes {}
}

resource "google_apphub_workload" "nc2" {
  project = "PDE"
  display_name = "Workload nc2"
  location = "us-central1"
  application_id = google_apphub_application.application-nc.application_id
  workload_id = google_compute_region_instance_group_manager.mig.name
  discovered_workload = "catalog-discovered-workload-path"
}
