resource "google_vpc_access_connector" "non_compliant_example_1" {
  name          = "non_compliant_example_1"
  project       = "fluent-coder-468700-h4"
  region        = "australia-southeast1"
  ip_cidr_range = "10.8.0.0/28"
  network       = "default"
  machine_type  = "n1-standard-1"
  min_instances = 2
  max_instances = 5
}
