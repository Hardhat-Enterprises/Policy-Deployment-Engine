

resource "google_vmwareengine_network_policy" "c" {
  project               = "project-d7f19645-ccba-48ef-bce"
  location              = "us-west1"
  name                  = "c"
  edge_services_cidr    = "192.168.30.0/26"
  vmware_engine_network = "projects/599444694846/locations/global/vmwareEngineNetworks/c"
  description           = "c"
  internet_access {
    enabled = false
  }
  external_ip {
    enabled = false
  }
}
