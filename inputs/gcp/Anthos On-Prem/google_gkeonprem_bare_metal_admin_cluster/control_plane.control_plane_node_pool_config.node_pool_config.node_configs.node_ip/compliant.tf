resource "google_gkeonprem_bare_metal_admin_cluster" "compliant_example_1" {
  name = "compliant_example_1"
  project = "PDE"
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
    api_server_args {
      argument = "test argument"
      value = "test value"
    }
  }
}
