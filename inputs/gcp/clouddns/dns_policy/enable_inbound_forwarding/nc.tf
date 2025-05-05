# Describe your resource type here
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant

resource "google_dns_policy" "nc" {
    name = "enable_inbound"
    project = "inbound"
    enable_inbound_forwarding = true
}