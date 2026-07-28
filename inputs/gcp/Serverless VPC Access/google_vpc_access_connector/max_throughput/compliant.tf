resource "google_vpc_access_connector" "compliant_example_1" {
  name           = "compliant_example_1"
  project        = "PDE"
  region         = "australia-southeast1"
  ip_cidr_range  = "10.8.0.0/28"
  network        = "default"
  min_throughput = 200
  max_throughput = 300
}
