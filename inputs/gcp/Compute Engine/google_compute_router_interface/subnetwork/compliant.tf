resource "google_compute_router_interface" "compliant_example_1" {
  name       = "compliant-interface-1"
  router     = "router-1"
  subnetwork = "projects/approved-project/regions/australia-southeast1/subnetworks/approved-subnetwork"
}
