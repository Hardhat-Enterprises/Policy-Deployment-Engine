resource "google_gkeonprem_bare_metal_admin_cluster" "non_compliant_example_1" {
  name = "non_compliant_example_1"
  project = "PDE"
  location = "us-west1"
  control_plane {
    control_plane_node_pool_config {
      node_pool_config {
        operating_system = "WINDOWS"
        node_configs {
          node_ip = "8.8.8.8"
        }
        node_configs {
          node_ip = "1.1.1.1"
        }
        node_configs {
          node_ip = "52.14.23.88"
        }
      }
    }
    api_server_args {
      argument = "test argument"
      value = "test value"
    }
  }
}
