resource "google_compute_security_policy" "compliant_example_1" {
  name = "compliant-example-1"

  advanced_options_config {
    user_ip_request_headers = ["True-Client-IP"]
  }
}