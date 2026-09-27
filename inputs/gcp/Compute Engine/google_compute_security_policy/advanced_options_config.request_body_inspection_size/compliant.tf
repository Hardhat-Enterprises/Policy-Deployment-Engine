resource "google_compute_security_policy" "compliant_example_1" {
  name = "compliant-example-1"

  advanced_options_config {
    request_body_inspection_size = "64KB"
  }
}