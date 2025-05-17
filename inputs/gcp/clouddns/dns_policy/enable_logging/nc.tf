

resource "google_dns_policy" "nc" {
  name   = "first_policy"
  project = "dns_policies"
  enable_logging = false
}