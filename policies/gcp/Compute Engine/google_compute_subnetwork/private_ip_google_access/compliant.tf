resource "google_compute_subnetwork" "compliant_example_1" {
  name                     = "compliant-example-1"
  project                  = "pde-project"
  network                  = "default"
  ip_cidr_range            = "10.10.0.0/24"
  region                   = "australia-southeast1"
  private_ip_google_access = true
}
