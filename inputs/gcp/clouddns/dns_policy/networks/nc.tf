

resource "google_dns_policy" "nc" {
    name = "networks"
    project = "dns_polices"
    networks {
      network_url = ""
    }
}
