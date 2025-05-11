resource "google_container_azure_node_pool" "c" {
  name     = "pool-c"
  cluster  = "test-cluster"
  location = "australia-southeast1"
  version  = "1.27.3-gke.100"

  config {
    vm_size = "Standard_D2s_v3"

    ssh_config {
      authorized_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC..."
    }
  }

  subnet_id = "projects/your-project-id/regions/australia-southeast1/subnetworks/default"

  autoscaling {
    min_node_count = 1
    max_node_count = 3
  }

  max_pods_constraint {
    max_pods_per_node = 110
  }

  management {
    auto_repair = true
  }
}
