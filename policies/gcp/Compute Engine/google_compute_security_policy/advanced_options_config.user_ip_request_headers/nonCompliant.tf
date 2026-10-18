resource "google_compute_security_policy" "non_compliant_example_1" {
  name = "non-compliant-example-1"

  advanced_options_config {
    user_ip_request_headers = ["X-Forwarded-For"]
  }
}