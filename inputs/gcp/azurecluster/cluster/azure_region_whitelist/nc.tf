resource "google_container_azure_cluster" "nc" {
  name                 = "cluster-noncompliant"
  location             = "us-central1"
  azure_region         = "unapproved-region"
  project              = "chrome-ability-456100-t1"
  resource_group_id    = "example-resource-group"

  fleet {
    project = "chrome-ability-456100-t1"
  }

  authorization {
    admin_users {
      username = "admin@example.com"
    }
  }

  control_plane {
    subnet_id = "subnet-1"
    version   = "1.27.3-gke.100"

    ssh_config {
      authorized_key = "ssh-rsa example-key"
    }
  }

  networking {
    virtual_network_id          = "vnet-1"
    pod_address_cidr_blocks     = ["10.0.0.0/16"]
    service_address_cidr_blocks = ["10.1.0.0/20"]
  }
}
