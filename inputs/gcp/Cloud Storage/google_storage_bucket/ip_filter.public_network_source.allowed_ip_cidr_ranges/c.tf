resource "google_storage_bucket" "c123" {
  name     = "c123"
  location = "AU"

  ip_filter {
    mode = "Enabled"
    public_network_source {
      allowed_ip_cidr_ranges = ["172.0.0.0/0"]
    }
  }
}
