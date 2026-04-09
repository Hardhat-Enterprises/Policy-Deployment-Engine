resource "google_vmwareengine_external_access_rule" "c" {
  name = "c"
  parent =  "c"
  priority = 101
  action = "ALLOW"
  ip_protocol = "TCP"
  source_ip_ranges {
    ip_address_range = "100.0.0.0/0"
  }
  source_ports = ["80"]
  destination_ip_ranges {
    ip_address_range = "100.0.0.0/0"
  }
  destination_ports = ["433"]
}
