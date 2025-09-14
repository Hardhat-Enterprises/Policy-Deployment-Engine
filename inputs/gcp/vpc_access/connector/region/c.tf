resource "google_vpc_access_connector" "c" {
  name          = "compliant-connector"
  region        = "us-central1"  # Compliant region
  ip_cidr_range = "10.8.0.0/28"
  network       = "default"
}