resource "google_container_azure_cluster" "c" {
  name              = "cluster-c"
  location          = "australiaeast"
  azure_region      = "australiaeast"
  resource_group_id = "fake-rg"

  control_plane {
    version    = "1.28.1"
    subnet_id  = "subnet-id"
    ssh_config {
      authorized_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDexample"
    }
  }

  networking {
    virtual_network_id          = "vnet-id"
    pod_address_cidr_blocks     = ["10.0.0.0/16"]
    service_address_cidr_blocks = ["10.1.0.0/20"]
  }

  authorization {
    admin_users {
      username = "admin@example.com"
    }
  }

  fleet {
    project = "fake-project"
  }
}
