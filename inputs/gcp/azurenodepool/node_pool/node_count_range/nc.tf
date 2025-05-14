resource "google_container_azure_node_pool" "nc" {
  name      = "nodepool-nc"
  location  = "australiaeast"
  version   = "1.28.1"
  cluster   = "fake-cluster-id"
  subnet_id = "fake-subnet-id"

  autoscaling {
    min_node_count = 0
    max_node_count = 10
  }

  max_pods_constraint {
    max_pods_per_node = 110
  }

  config {
    vm_size = "Standard_D2s_v3"

    root_volume {
      size_gib = 128
    }

    ssh_config {
      authorized_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDexample"
    }

    tags = {
      env = "dev"
    }
  }
}
