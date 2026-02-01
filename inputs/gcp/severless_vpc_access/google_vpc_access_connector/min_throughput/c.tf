resource "google_vpc_access_connector" "c" {
  name           = "c"
  project        = "PDE"
  region         = "australia-southeast1"
  ip_cidr_range  = "10.8.0.0/28"
  network        = "default"
  min_throughput = 300
  max_throughput = 500
}