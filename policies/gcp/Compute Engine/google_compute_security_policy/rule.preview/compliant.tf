resource "google_compute_security_policy" "compliant_example_1" {
  name = "compliant-example-1"

  rule {
    action   = "deny(403)"
    priority = "1000"
    preview  = false
    match {
      versioned_expr = "SRC_IPS_V1"
      config {
        src_ip_ranges = ["9.9.9.0/24"]
      }
    }
  }
}