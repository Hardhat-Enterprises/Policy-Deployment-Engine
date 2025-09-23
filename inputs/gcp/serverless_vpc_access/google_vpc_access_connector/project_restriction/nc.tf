resource "google_vpc_access_connector" "nc" {
  name          = "nc"
  project       = "dev-project-468700"  # Non-compliant: dev project
  region        = "australia-southeast1"
  network       = "default"
  ip_cidr_range = "10.9.0.0/28"
}