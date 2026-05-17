resource "google_dns_response_policy" "response-policy-nc" {
  response_policy_name = "nc-response-policy"
}

resource "google_dns_response_policy_rule" "nc" {
  response_policy = google_dns_response_policy.response-policy-nc.response_policy_name
  rule_name       = "nc"
  dns_name        = "*."

  local_data {
    local_datas {
      name    = "example.com."
      type    = "A"
      ttl     = 300
      rrdatas = ["192.0.2.91"]
    }
  }
}