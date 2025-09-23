resource "google_vpc_access_connector" "nc" {
  name          = "nc"
  region        = "australia-southeast1"
  network       = "default"
  ip_cidr_range = "200.8.0.0/28"  # Non-compliant: not RFC 1918
}