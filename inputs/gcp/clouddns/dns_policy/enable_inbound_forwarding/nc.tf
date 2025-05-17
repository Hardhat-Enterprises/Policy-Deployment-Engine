

resource "google_dns_policy" "nc" {
    name = "enable_inbound"
    project = "inbound"
    enable_inbound_forwarding = true
}