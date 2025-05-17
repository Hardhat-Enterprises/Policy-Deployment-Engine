

resource "google_dns_policy" "c" {
    name = "networks"
    project = "dns_polices"
    networks {
      network_url = "http://love_writing_polices_for_yotham.net.id"
    }
}


