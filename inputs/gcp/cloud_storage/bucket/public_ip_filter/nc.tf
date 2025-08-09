resource "google_storage_bucket" "nc" {
name = "gcp-test-bucket-nc"
location ="AU"
    
ip_filter {
  mode = "Enabled"
  public_network_source {
    allowed_ip_cidr_ranges = ["0.0.0.0/0"]
  }
}

}
