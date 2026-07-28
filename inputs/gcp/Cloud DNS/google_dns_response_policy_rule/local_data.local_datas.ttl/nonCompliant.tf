resource "google_dns_response_policy_rule" "non_compliant_example_1" {
  response_policy = "nc-response-policy"
  rule_name       = "non_compliant_example_1"
  dns_name        = "nc.example.com."
  project         = "demo-project"

  local_data {
    local_datas {
      name    = "nc.example.com."
      type    = "A"
      ttl     = 60
      rrdatas = ["192.0.2.91"]
    }
  }
}
