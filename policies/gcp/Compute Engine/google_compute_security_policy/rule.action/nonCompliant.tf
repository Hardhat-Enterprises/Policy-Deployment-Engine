resource "google_compute_security_policy" "non_compliant_example_1" {
  name = "non-compliant-example-1"

  rule {
    action   = "allow"
    priority = "1000"
    match {
      versioned_expr = "SRC_IPS_V1"
      config {
        src_ip_ranges = ["9.9.9.0/24"]
      }
    }
  }
}