resource "google_vpc_access_connector" "nc" {
  name          = "non-compliant-connector"
  region        = "asia-east1"  # Non-compliant region
  ip_cidr_range = "10.8.0.16/28"
  network       = "default"
}