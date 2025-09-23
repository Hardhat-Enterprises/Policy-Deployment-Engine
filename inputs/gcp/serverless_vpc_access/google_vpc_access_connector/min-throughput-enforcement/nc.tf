resource "google_vpc_access_connector" "nc" {
  name           = "nc"
  region         = "australia-southeast1"
  network        = "default"
  ip_cidr_range  = "10.9.0.0/28"
  min_throughput = 200  # Exactly at Google's minimum, but compliant with your policy
  max_throughput = 300
}