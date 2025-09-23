resource "google_vpc_access_connector" "nc" {
  name          = "nc"
  region        = "us-central1"
  network       = "default"
  ip_cidr_range = "10.9.0.0/28"
}