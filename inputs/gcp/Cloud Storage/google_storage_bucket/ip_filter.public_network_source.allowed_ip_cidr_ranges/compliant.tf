resource "google_storage_bucket" "compliant_example_1" {
  name     = "compliant_example_1"
  location = "AU"

  ip_filter {
    mode = "Enabled"
    public_network_source {
      allowed_ip_cidr_ranges = ["172.0.0.0/0"]
    }
  }
}
