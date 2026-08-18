# application block

resource "google_apphub_workload" "non_compliant_example_1" {
  project = "PDE"
  display_name = "Workload nc1"
  location = "australia-southeast1"
  application_id = "online-store-nc"
  workload_id = "mig-nc"
  discovered_workload = "catalog-discovered-workload-path"

  attributes {}
}

resource "google_apphub_workload" "non_compliant_example_2" {
  project = "PDE"
  display_name = "Workload nc2"
  location = "australia-southeast1"
  application_id = "online-store-nc"
  workload_id = "mig-nc"
  discovered_workload = "catalog-discovered-workload-path"
}
