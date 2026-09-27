# Tests the s_sl_info.protocols argument.
# TLSv1.2 and TLSv1.3 are approved protocols for secure communication.

resource "google_apigee_target_server" "compliant_example_1" {
  name     = "modern-tls-target-server"
  host     = "backend.example.com"
  port     = 443
  protocol = "HTTP"
  env_id   = "organizations/example-org/environments/test"

  s_sl_info {
    enabled = true

    protocols = [
      "TLSv1.2",
      "TLSv1.3"
    ]
  }
}
