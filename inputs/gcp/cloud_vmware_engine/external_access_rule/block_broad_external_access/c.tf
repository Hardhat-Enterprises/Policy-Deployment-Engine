resource "google_vmwareengine_network" "external-access-rule-nw" {
  name        = "sample-nw"
  location    = "global"
  type        = "STANDARD"
  description = "PC network description."
}

resource "google_vmwareengine_network_policy" "external-access-rule-np" {
  location = "us-west1"
  name = "sample-np"
  edge_services_cidr = "192.168.30.0/26"
  vmware_engine_network = google_vmwareengine_network.external-access-rule-nw.id
}

resource "google_vmwareengine_external_access_rule" "c" {
  name = "sample-external-access-rule-c"
  parent =  google_vmwareengine_network_policy.external-access-rule-np.id
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
