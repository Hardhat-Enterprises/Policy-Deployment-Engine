
resource "google_vmwareengine_network_policy" "nc" {
  project               = "project-d7f19645-ccba-48ef-bce"
  location              = "us-west1"
  name                  = "nc"
  edge_services_cidr    = "192.168.30.0/26"
  vmware_engine_network = "projects/599444694846/locations/global/vmwareEngineNetworks/nc"
  description           = "nc"
  internet_access {
    enabled = true
  }
  external_ip {
    enabled = true
  }
}