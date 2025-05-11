resource "google_container_azure_cluster" "c" {
  name              = "cluster-c"
  location          = "australiaeast"
  azure_region      = "australiaeast"
  resource_group_id = "rg-123"
  
  fleet {
    project = "secure-fleet"
  }

  control_plane {
    subnet_id = "subnet-123"
    version   = "1.27.2-gke.1200"
    ssh_config {
      authorized_key = "valid-key"
    }
  }

  authorization {
    admin_users {
      username = "admin@example.com"
    }
  }

  networking {
    virtual_network_id         = "vnet-123"
    service_address_cidr_blocks = ["10.96.0.0/12"]
    pod_address_cidr_blocks     = ["192.168.0.0/16"]
  }
}
