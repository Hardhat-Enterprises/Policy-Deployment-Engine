resource "google_container_azure_cluster" "c" {
  name               = "cluster-compliant"
  location           = "australia-southeast1"
  resource_group_id  = "example-resource-group"
  azure_region       = "australiaeast"

  authorization {
    admin_users {
      username = "admin@example.com"
    }
  }

  control_plane {
    subnet_id = "example-subnet-id"
    version   = "1.27.3-gke.100"
    ssh_config {
      authorized_key = "ssh-rsa AAAAB3Nza..."
    }
  }

  networking {
    virtual_network_id           = "example-network-id"
    pod_address_cidr_blocks      = ["10.0.0.0/16"]
    service_address_cidr_blocks  = ["10.1.0.0/16"]
  }

  fleet {
    project = "my-gcp-fleet"
  }
}
