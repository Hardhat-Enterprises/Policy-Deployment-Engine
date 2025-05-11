resource "google_container_azure_cluster" "nc" {
  name              = "testcluster-x"
  location          = "australia-southeast1"
  azure_region      = "australiaeast"
  project           = "chrome-ability-456100-t1"
  resource_group_id = "fake-resource-group"

  authorization {
    admin_users {
      username = "admin@example.com"
    }
  }

  control_plane {
    subnet_id = "subnet-nc"
    version   = "1.28.5-gke.1086000"
    ssh_config {
      authorized_key = "ssh-rsa AAAAB3..."
    }
  }

  networking {
    virtual_network_id         = "vnet-nc"
    pod_address_cidr_blocks    = ["10.0.0.0/16"]
    service_address_cidr_blocks = ["10.1.0.0/16"]
  }

  fleet {
    project = "chrome-ability-456100-t1"
  }
}
