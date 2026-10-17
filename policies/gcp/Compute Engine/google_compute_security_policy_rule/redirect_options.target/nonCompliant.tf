# Non-compliant fixture: the external redirect target uses plaintext HTTP.

resource "google_compute_security_policy_rule" "non_compliant_example_1" {
  security_policy = "example-security-policy"
  priority        = 1000
  action          = "redirect"

  redirect_options {
    type   = "EXTERNAL_302"
    target = "http://example.com/redirect"
  }
}