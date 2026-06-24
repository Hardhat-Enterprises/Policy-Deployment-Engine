resource "google_vmwareengine_private_cloud" "compliant_example_1" {
  location    = "australia-southeast-1"
  name        = "compliant_example_1"
  description = "Sample test PC."
  type        = "STRETCHED"
  network_config {
    management_cidr       = "192.168.30.0/24"
    vmware_engine_network = "projects/my-project/locations/global/vmwareEngineNetworks/pc-nw"
  }
  management_cluster {
    cluster_id = "sample-mgmt-cluster"

      stretched_cluster_config {
        preferred_location = "projects/projectabc/locations/australia-southeast1-a"
        secondary_location = "projects/projectabc/locations/australia-southeast2-b"
    
  }
  }

}
 

