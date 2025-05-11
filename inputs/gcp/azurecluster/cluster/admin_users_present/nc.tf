resource "google_container_azure_cluster" "nc" {
  name              = "non-compliant-cluster"
  azure_region      = "australiaeast"
  resource_group_id = "fake-resource-group-id"

  fleet {
    project = "non-compliant-project"
  }

  authorization {
    admin_users {
      username = "unauthorized-user@example.com"  # Not allowed
    }
  }

  control_plane {
    subnet_id = "fake-subnet-id"
    version   = "1.28.0-gke.12345"
    ssh_config {
      authorized_key = "ssh-rsa FAKEKEY"
    }
  }

  networking {
    virtual_network_id           = "fake-vnet-id"
    pod_address_cidr_blocks      = ["10.0.0.0/16"]
    service_address_cidr_blocks  = ["10.1.0.0/16"]
  }

  location = "australiaeast"
}
