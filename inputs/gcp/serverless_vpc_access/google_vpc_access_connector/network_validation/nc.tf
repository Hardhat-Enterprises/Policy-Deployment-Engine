resource "google_vpc_access_connector" "nc" {
  name          = "nc"
  region        = "australia-southeast1"
  network       = "projects/fluent-coder-468700-h4/global/networks/dev-vpc"  # Non-compliant: not production
  ip_cidr_range = "10.9.0.0/28"
}