resource "google_storage_bucket" "nc123" {
  name     = "nc123"
  location = "AU"

  ip_filter {
    mode = "Enabled"
    public_network_source {
      allowed_ip_cidr_ranges = ["0.0.0.0/0"]
    }
  }

}
