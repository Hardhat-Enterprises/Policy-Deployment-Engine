# Compliant fixture: the external redirect target uses HTTPS.

resource "google_compute_security_policy_rule" "compliant_example_1" {
  security_policy = "example-security-policy"
  priority        = 1000
  action          = "redirect"

  redirect_options {
    type   = "EXTERNAL_302"
    target = "https://example.com/redirect"
  }
}