resource "google_vpc_access_connector" "c" {
  name          = "c"
  region        = "australia-southeast1"
  network       = "default"
  ip_cidr_range = "10.8.0.0/28"
  min_instances = 2
  max_instances = 8  # Compliant: <= 10
}