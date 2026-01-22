resource "google_vmwareengine_external_access_rule" "nc" {
  name = "nc"
  parent =  "nc"
  priority = 101
  action = "ALLOW"
  ip_protocol = "UDP"
  source_ip_ranges {
    ip_address_range = "0.0.0.0/0"
  } 
  source_ports = ["*"]
  destination_ip_ranges {
    ip_address_range = "0.0.0.0/0"
  }
  destination_ports = ["*"]
}