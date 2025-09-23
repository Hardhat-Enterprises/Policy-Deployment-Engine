resource "google_vpc_access_connector" "nc" {
  name          = "nc"
  region        = "australia-southeast1"
  network       = "default"
  ip_cidr_range = "10.9.0.0/28"
  min_instances = 1  # Non-compliant: < 2, no HA
  max_instances = 3
}