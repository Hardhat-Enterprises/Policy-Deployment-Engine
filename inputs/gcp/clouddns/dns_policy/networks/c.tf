# Describe your resource type here
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "google_dns_policy" "c" {
    name = "networks"
    project = "dns_polices"
    networks {
      network_url = "http://love_writing_polices_for_yotham.net.id"
    }
}


