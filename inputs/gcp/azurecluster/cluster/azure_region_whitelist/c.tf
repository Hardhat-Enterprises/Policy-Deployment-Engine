resource "google_container_azure_cluster" "c" {
    name              = "cluster-c"
    location          = "australiaeast"
    azure_region      = "australiaeast"
    resource_group_id = "rg-secure"
    project           = "chrome-ability-456100-t1"
  
    fleet {
      project = "chrome-ability-456100-t1"
    }
  
    authorization {
      admin_users {
        username = "admin@example.com"
      }
    }
  
    control_plane {
      subnet_id = "subnet-secure"
      version   = "1.28.5-gke.1086000"
      ssh_config {
        authorized_key = "ssh-rsa AAAAB3Nz..."
      }
    }
  
    networking {
      virtual_network_id          = "vnet-secure"
      pod_address_cidr_blocks     = ["10.0.0.0/16"]
      service_address_cidr_blocks = ["10.1.0.0/16"]
    }
  }
  