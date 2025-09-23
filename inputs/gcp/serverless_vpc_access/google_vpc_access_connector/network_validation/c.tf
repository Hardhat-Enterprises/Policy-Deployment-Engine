resource "google_vpc_access_connector" "c" {
  name          = "c"
  region        = "australia-southeast1"
  network       = "projects/fluent-coder-468700-h4/global/networks/prod-vpc"
  ip_cidr_range = "10.8.0.0/28"
}