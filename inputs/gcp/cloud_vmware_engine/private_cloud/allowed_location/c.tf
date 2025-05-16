resource "google_vmwareengine_private_cloud" "c" {
  location    = "australia-southeast1"
  name        = "sample-private-cloud-c"
  description = "Sample test PC."
  network_config {
    management_cidr       = "192.168.30.0/24"
    vmware_engine_network = google_vmwareengine_network.pc-nw.id
  }
  management_cluster {
    cluster_id = "sample-mgmt-cluster"
    node_type_configs {
      node_type_id = "standard-72"
      node_count   = 3
    }
  }
}

resource "google_vmwareengine_network" "pc-nw" {
  name        = "pc-nw"
  location    = "global"
  type        = "STANDARD"
  description = "PC network description."
}
