resource "google_vpc_access_connector" "nc" {
  name           = "nc"
  region         = "australia-southeast1"
  network        = "default"
  ip_cidr_range  = "10.9.0.0/28"
  min_throughput = 200
  max_throughput = 250  # Non-compliant with YOUR policy (< 300) but valid for Google
}