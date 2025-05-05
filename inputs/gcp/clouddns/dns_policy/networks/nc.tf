# Describe your resource type here
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant

resource "google_dns_policy" "nc" {
    name = "networks"
    project = "dns_polices"
    networks {
      network_url = ""
    }
}
