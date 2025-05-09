
resource "google_container_cluster" "c" {
    name = "cluster-1"
    project = " dns_managed_zone"
    location = "australia-southeast2"
    initial_node_count = 1

    networking_mode = "VPC_NATIVE"
    default_snat_status {
      disabled = true
    }
}
