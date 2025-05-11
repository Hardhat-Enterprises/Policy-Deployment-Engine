resource "google_container_azure_cluster" "nc" {
  name              = "cluster-nc"
  location          = "us-central1"
  azure_region      = "us-central1"
  resource_group_id = "rg-456"
  
  fleet {
    project = "random-dev-project"
  }

  control_plane {
    subnet_id = "subnet-456"
    version   = "1.27.2-gke.1200"
    ssh_config {
      authorized_key = "invalid-key"
    }
  }

  authorization {
    admin_users {
      username = "admin@example.com"
    }
  }

  networking {
    virtual_network_id         = "vnet-456"
    service_address_cidr_blocks = ["10.96.0.0/12"]
    pod_address_cidr_blocks     = ["192.168.0.0/16"]
  }
}
