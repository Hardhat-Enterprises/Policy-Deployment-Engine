resource "google_container_azure_cluster" "c" {
  name              = "cluster-c"
  location          = "australiaeast"
  azure_region      = "australiaeast"
  resource_group_id = "fake-resource-group-id"

  control_plane {
  version    = "1.28.1"  # or 1.22.0 for non-compliant
  subnet_id  = "fake-subnet-id"

  ssh_config {
    authorized_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC7example"
  }
}


  networking {
    virtual_network_id          = "fake-vnet-id"
    pod_address_cidr_blocks     = ["10.0.0.0/16"]
    service_address_cidr_blocks = ["10.1.0.0/20"]
  }

  authorization {
    admin_users {
      username = "admin@example.com"
    }
  }

  fleet {
    project = "secure-fleet-prod"
  }
}
