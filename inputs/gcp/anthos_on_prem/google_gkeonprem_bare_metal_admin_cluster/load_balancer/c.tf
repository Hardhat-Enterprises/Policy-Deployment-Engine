resource "google_gkeonprem_bare_metal_admin_cluster" "c" {
  name     = "c"
  project  = "PDE"
  location = "australia_southeast1"
  control_plane {
    control_plane_node_pool_config {
      node_pool_config {
        operating_system = "LINUX"
        node_configs {
          node_ip = "10.200.0.2"
        }
        node_configs {
          node_ip = "10.200.0.3"
        }
        node_configs {
          node_ip = "10.200.0.4"
        }
      }
    }

  }
  load_balancer {
    port_config {
      control_plane_load_balancer_port = 443
    }
    vip_config {
      control_plane_vip = "10.200.0.5"
    }
  }
}