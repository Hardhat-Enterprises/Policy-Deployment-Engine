

resource "google_dns_policy" "c" {
  name   = "first_policy"
  project = "dns_policies"
  enable_logging = true
 
}
