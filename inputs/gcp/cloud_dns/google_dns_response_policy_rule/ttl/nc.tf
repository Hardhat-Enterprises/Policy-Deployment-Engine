resource "google_dns_response_policy" "response-policy-nc" {
  response_policy_name = "nc-response-policy"
  project              = "demo-project"
}

resource "google_dns_response_policy_rule" "nc" {
  response_policy = google_dns_response_policy.response-policy-nc.response_policy_name
  rule_name       = "nc"
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