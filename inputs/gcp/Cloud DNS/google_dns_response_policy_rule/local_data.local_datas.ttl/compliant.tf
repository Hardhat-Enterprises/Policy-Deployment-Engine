resource "google_dns_response_policy_rule" "compliant_example_1" {
  response_policy = "c-response-policy"
  rule_name       = "compliant_example_1"
  dns_name        = "dns.example.com."
  project         = "demo-project"

  local_data {
    local_datas {
      name    = "dns.example.com."
      type    = "A"
      ttl     = 300
      rrdatas = ["192.0.2.91"]
    }
  }
}
