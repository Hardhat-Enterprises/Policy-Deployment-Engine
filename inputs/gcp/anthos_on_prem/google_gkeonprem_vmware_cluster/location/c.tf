resource "google_gkeonprem_vmware_cluster" "cluster-basic" {
  name = "cluster-basic"
  project = "my-project"
  location = "us-west1"
  admin_cluster_membership = "projects/870316890899/locations/global/memberships/gkeonprem-terraform-test"
  on_prem_version = "1.13.1-gke.35"
  network_config {
    service_address_cidr_blocks = ["10.96.0.0/12"]
    pod_address_cidr_blocks = ["192.168.0.0/16"]
    dhcp_ip_config {
      enabled = true
    }
  }
  control_plane_node {}
  load_balancer {
    metal_lb_config {
      address_pools {
        pool = "ingress-ip"
        addresses = ["10.251.135.19"]
      }
      address_pools {
        pool = "lb-test-ip"
        addresses = ["10.251.135.19"]
      }
    }
  }
}