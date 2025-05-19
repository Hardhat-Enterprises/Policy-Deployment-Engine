# Compliant OS Config Guest Policies with proper OS type targeting
# This resource properly specifies OS types and zones for effective targeting

resource "google_os_config_guest_policies" "c" {
  provider = google-beta
  project         = "pde-s224021028"
  guest_policy_id = "guest-policy-compliant"
  description     = "Compliant guest policy with proper OS type targeting"
  
  # Package configuration
  packages {
    name          = "python3"
    desired_state = "INSTALLED"
  }
  
  packages {
    name          = "openssh-server"
    desired_state = "INSTALLED"
  }
  
  # Proper OS type targeting
  assignment {
    # Targeting specific zones in approved regions
    zones = ["australia-southeast1-a", "australia-southeast1-b"]
    
    # Targeting both Linux and Windows
    os_types {
      os_short_name = "debian"
      os_version    = "*"
    }
    
    os_types {
      os_short_name = "ubuntu"
      os_version    = "*"
    }
    
    os_types {
      os_short_name = "windows"
      os_version    = "10.0.14393"
    }
    
    # Instance filtering options
    instance_name_prefixes = ["web-", "app-"]
    instances = ["projects/pde-s224021028/zones/australia-southeast1-a/instances/web-server-1"]
    
    # Label-based targeting
    group_labels {
      labels = {
        environment = "production"
        application = "web"
      }
    }
  }
  
  # Recipe configuration
  recipes {
    name           = "guest_policy_recipe"
    desired_state  = "INSTALLED"
    
    artifacts {
      id        = "script"
      
      remote {
        uri = "gs://my-bucket/scripts/install.sh"
      }
    }
    
    install_steps {
      script_run {
        script = "#!/bin/bash\necho 'Running install script'\n"
      }
    }
  }
}