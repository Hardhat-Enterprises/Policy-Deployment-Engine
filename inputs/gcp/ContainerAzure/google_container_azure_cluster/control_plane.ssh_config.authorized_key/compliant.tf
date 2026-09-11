resource "google_container_azure_cluster" "compliant_example_1" {
  azure_region = "australia-southeast1"
  client       = "projects/my-project-number/locations/us-west1/azureClients/client-name"
  location     = "australia-southeast1"
  name         = "compliant_example_1"
  project      = "my-project-name"

  authorization {
    admin_users {
      username = "mmv2@google.com"
    }
  }

  control_plane {
    ssh_config {
      authorized_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDc1234567890== thomasrodgers"
    }

    subnet_id = "/subscriptions/12345678-1234-1234-1234-123456789111/resourceGroups/my--dev-byo/providers/Microsoft.Network/virtualNetworks/my--dev-vnet/subnets/default"
    version    = "1.19.10-gke.1000"
  }

  fleet {
    project = "my-project-number"
  }

  networking {
    pod_address_cidr_blocks    = ["10.200.0.0/16"]
    service_address_cidr_blocks = ["10.32.0.0/24"]
    virtual_network_id          = "/subscriptions/12345678-1234-1234-1234-123456789111/resourceGroups/my--dev-byo/providers/Microsoft.Network/virtualNetworks/my--dev-vnet"
  }

  resource_group_id = "/subscriptions/12345678-1234-1234-1234-123456789111/resourceGroups/my--dev-cluster"

  deletion_policy = "PREVENT"
}