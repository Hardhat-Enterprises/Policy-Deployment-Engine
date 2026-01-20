resource "google_vpc_access_connector" "c" {
  name          = "c"
  project       = "PDE"
  region        = "australia-southeast1"
  ip_cidr_range = "10.8.0.0/28"
  network       = "default"
  machine_type  = "e2-standard-4"
  min_instances = 2
  max_instances = 5
}