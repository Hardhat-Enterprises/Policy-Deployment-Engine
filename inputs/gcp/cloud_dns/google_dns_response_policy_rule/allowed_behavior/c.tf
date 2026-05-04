resource "google_dns_response_policy" "response-policy-c" {
  response_policy_name = "c-response-policy"
}

resource "google_dns_response_policy_rule" "c" {
  response_policy = google_dns_response_policy.response-policy-c.response_policy_name
  rule_name       = "c"
  dns_name        = "dns.example.com."

  local_data {
    local_datas {
      name    = "dns.example.com."
      type    = "A"
      ttl     = 300
      rrdatas = ["192.0.2.91"]
    }
  }
}