# Tests the s_sl_info.ciphers argument of google_apigee_target_server.
# The configured 3DES cipher is outdated and provides inadequate protection.

resource "google_apigee_target_server" "non_compliant_example_1" {
  name     = "weak-cipher-target-server"
  host     = "backend.example.com"
  port     = 443
  protocol = "HTTP"
  env_id   = "organizations/example-org/environments/test"

  s_sl_info {
    enabled = true

    ciphers = [
      "TLS_RSA_WITH_3DES_EDE_CBC_SHA"
    ]
  }
}