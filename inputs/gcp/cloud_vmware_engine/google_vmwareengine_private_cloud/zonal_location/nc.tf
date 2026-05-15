resource "google_vmwareengine_private_cloud" "nc" {
  project     = "project-d7f19645-ccba-48ef-bce"
  location    = "australia-southeast1-a"
  name        = "nc"
  description = "nc"
  type        = "STRETCHED"
  network_config {
    management_cidr       = "192.168.30.0/24"
    vmware_engine_network = "projects/599444694846/locations/global/vmwareEngineNetworks/nc"
  }
  management_cluster {
    cluster_id = "nc"

    stretched_cluster_config {
      preferred_location = "projects/projectabc/locations/asia-southeast2-c"
      secondary_location = "projects/projectabc/locations/asia-southeast1-b"

    }
  }

}

