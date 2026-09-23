resource "google_compute_security_policy" "non_compliant_example_1" {
  name = "non-compliant-example-1"

  advanced_options_config {
    request_body_inspection_size = "8KB"
  }
}