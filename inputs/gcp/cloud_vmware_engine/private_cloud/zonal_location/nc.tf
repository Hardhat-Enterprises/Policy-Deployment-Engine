resource "google_vmwareengine_private_cloud" "nc" {
  location    = "australia-southeast-1"
  name        = "sample-private-cloud-nc"
  description = "Sample test PC."
  type        = "STRETCHED"
  network_config {
    management_cidr       = "192.168.30.0/24"
    vmware_engine_network = google_vmwareengine_network.pc-nw_nc.id
  }
  management_cluster {
    cluster_id = "sample-mgmt-cluster"

      stretched_cluster_config {
        preferred_location = "projects/projectabc/locations/asia-southeast2-c"
        secondary_location = "projects/projectabc/locations/asia-southeast1-b"
    
  }
  }

}
 


resource "google_vmwareengine_network" "pc-nw_nc" {
  name        = "pc-nw"
  location    = "global"
  type        = "STANDARD"
  description = "PC network description."
}
