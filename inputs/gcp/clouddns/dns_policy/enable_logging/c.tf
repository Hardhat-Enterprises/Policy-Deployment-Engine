# Describe your resource type here
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "google_dns_policy" "c" {
  name   = "first_policy"
  project = "dns_policies"
  enable_logging = true
 
}
