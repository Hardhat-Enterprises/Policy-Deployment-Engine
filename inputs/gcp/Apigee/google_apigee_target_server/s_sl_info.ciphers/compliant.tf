# Tests the s_sl_info.ciphers argument of google_apigee_target_server.
# The configured cipher provides strong authenticated encryption.

resource "google_apigee_target_server" "compliant_example_1" {
  name     = "secure-cipher-target-server"
  host     = "backend.example.com"
  port     = 443
  protocol = "HTTP"
  env_id   = "organizations/example-org/environments/test"

  s_sl_info {
    enabled = true

    ciphers = [
      "TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256"
    ]
  }
}