resource "google_gkeonprem_bare_metal_admin_cluster" "admin-cluster-basic" {
  name = "my-cluster"
  project = "my-project"
  location = "us-west1"
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

security_config {
    authorization {
      admin_users {
        username = "admin@hashicorptest.com"
      }
    }
  }
  }