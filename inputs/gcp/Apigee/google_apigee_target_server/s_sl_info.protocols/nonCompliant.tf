# Tests the s_sl_info.protocols argument.
# TLSv1 and TLSv1.1 are outdated and must not be used.

resource "google_apigee_target_server" "non_compliant_example_1" {
  name     = "legacy-tls-target-server"
  host     = "backend.example.com"
  port     = 443
  protocol = "HTTP"
  env_id   = "organizations/example-org/environments/test"

  s_sl_info {
    enabled = true

    protocols = [
      "TLSv1",
      "TLSv1.1"
    ]
  }
}