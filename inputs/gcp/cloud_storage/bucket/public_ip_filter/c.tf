resource "google_storage_bucket" "c" {
name = "gcp-test-bucket-c"
location ="AU"

ip_filter {
  mode = "Enabled"
  public_network_source {
    allowed_ip_cidr_ranges = ["172.0.0.0/0"]
  }
}
}
