resource "google_vmwareengine_private_cloud" "c" {
  project     = "project-d7f19645-ccba-48ef-bce"
  location    = "australia-southeast1-a"
  name        = "c"
  description = "c"
  type        = "STRETCHED"
  network_config {
    management_cidr       = "192.168.30.0/24"
    vmware_engine_network = "projects/599444694846/locations/global/vmwareEngineNetworks/c"
  }
  management_cluster {
    cluster_id = "c"

    stretched_cluster_config {
      preferred_location = "projects/projectabc/locations/australia-southeast1-a"
      secondary_location = "projects/projectabc/locations/australia-southeast2-b"

    }
  }

}

