resource "google_gkeonprem_vmware_cluster" "nc" {
  name = "nc"
  project = "PDE"
  location = "us_west1"
  admin_cluster_membership = "projects/870316890899/locations/global/memberships/gkeonprem-terraform-test"
  on_prem_version = "1.33.0-gke.35"
  network_config {
    service_address_cidr_blocks = ["10.96.0.0/12"]
    pod_address_cidr_blocks = ["192.168.0.0/16"]
    dhcp_ip_config {
      enabled = true
    }
  }
  control_plane_node {}
  load_balancer {
    vip_config {
      control_plane_vip = "10.251.133.5"
      ingress_vip = "10.251.135.19"
    }
    metal_lb_config {
      address_pools {
        pool = "ingress-ip"
        manual_assign = "true"
        addresses = ["10.251.135.19"]
      }
      address_pools {
        pool = "lb-test-ip"
        manual_assign = "true"
        addresses = ["10.251.135.19"]
      }
    }
  }
}

resource "google_gkeonprem_vmware_node_pool" "nc" {
  name = "nc"
  project = "PDE"
  location = "us_west1"
  vmware_cluster = google_gkeonprem_vmware_cluster.nc.name
  on_prem_version = "1.33.0-gke.35"
  config {
    image_type = "ubuntu_containerd"
    taints {
        key = "key"
        value = "value"
    }
    taints {
        key = "key"
        value = "value"
    }
  }
  node_pool_autoscaling {
    min_replicas = 0
    max_replicas = 10
  }
}