resource "google_gkeonprem_vmware_admin_cluster" "admin-cluster-full-nc" {
  name = "full"
  project = "my-project"
  location = "us-west1"
  on_prem_version = "1.31.0-gke.35"
  network_config {
    service_address_cidr_blocks = ["10.96.0.0/12"]
    pod_address_cidr_blocks = ["192.168.0.0/16"]
    ha_control_plane_config {
      control_plane_ip_block {
        gateway = "10.0.0.3"
        ips {
          ip       = "10.0.0.4"
        }
        netmask = "10.0.0.3/32"
      }
    }
    static_ip_config {
      ip_blocks {
        gateway = "10.0.0.1"
        ips {
          ip       = "10.0.0.2"
        }
        netmask = "10.0.0.3/32"
      }
    }
  }
  load_balancer {
    vip_config {
      control_plane_vip = "10.251.133.5"
    }
      f5_config {
      address = "10.251.135.22"
      partition = "test-parition"
      snat_pool = "test-snat-pool"
    }
    
  }
  addon_node {
    auto_resize_config {
      enabled = true
    }
  }
  anti_affinity_groups {
    aag_config_disabled = true
  }
  authorization {
    viewer_users {
      username = "https://google.com"
    }
  }
  auto_repair_config {
    enabled = true
  }
  platform_config {
    required_platform_version = "1.30.0"
  }
  proxy {
    url = "http://my-proxy.example.local:80"
  }
}