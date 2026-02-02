resource "google_vpc_access_connector" "nc" {
  name          = "nc"
  project       = "fluent-coder-468700-h4"
  region        = "australia-southeast1"
  ip_cidr_range = "192.168.1.0/28"
  network       = "default"
  min_instances = 2
  max_instances = 5
}