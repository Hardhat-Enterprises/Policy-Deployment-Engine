
resource "google_vmwareengine_network_policy" "c" {
  project               = "project-d7f19645-ccba-48ef-bce"
  location              = "australia-southeast1"
  name                  = "c"
  edge_services_cidr    = "192.168.30.0/26"
  vmware_engine_network = "projects/599444694846/locations/global/vmwareEngineNetworks/c"
}
