

resource "google_dns_policy" "c" {
    name = "enable_inbound"
    project = "inbound"
    enable_inbound_forwarding = false
}