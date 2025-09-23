resource "google_vpc_access_connector" "nc" {
  name          = "nc"
  region        = "australia-southeast1"
  network       = "default"
  ip_cidr_range = "10.9.0.0/28"
  machine_type  = "n1-standard-1"  # Non-compliant: not approved
}