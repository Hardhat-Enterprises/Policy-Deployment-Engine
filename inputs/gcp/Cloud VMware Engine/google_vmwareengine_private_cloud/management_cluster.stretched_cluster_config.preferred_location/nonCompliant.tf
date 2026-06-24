resource "google_vmwareengine_private_cloud" "non_compliant_example_1" {
  location    = "australia-southeast-1"
  name        = "non_compliant_example_1"
  description = "Sample test PC."
  type        = "STRETCHED"
  network_config {
    management_cidr       = "192.168.30.0/24"
    vmware_engine_network = "projects/my-project/locations/global/vmwareEngineNetworks/pc-nw"
  }
  management_cluster {
    cluster_id = "sample-mgmt-cluster"

      stretched_cluster_config {
        preferred_location = "projects/projectabc/locations/asia-southeast2-c"
        secondary_location = "projects/projectabc/locations/asia-southeast1-b"
    
  }
  }

}
 

