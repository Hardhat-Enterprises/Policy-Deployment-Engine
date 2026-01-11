resource "google_vpc_access_connector" "nc" {
  name          = "nc"
  project       = "my-project-id"
  region        = "australia-southeast1"
  ip_cidr_range = "10.8.0.0/28"
  network       = "default"
  min_instances = 1
  max_instances = 3
}