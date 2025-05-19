# Non-compliant OS Config Guest Policies with OS type targeting issues
# This resource has multiple compliance issues:
# 1. Missing OS type specification
# 2. Using unapproved zones

resource "google_os_config_guest_policies" "nc" {
  provider = google-beta
  project         = "pde-s224021028"
  guest_policy_id = "guest-policy-non-compliant"
  description     = "Non-compliant guest policy with OS type targeting issues"
  
  packages {
    name          = "python3"
    desired_state = "INSTALLED"
  }
  
  assignment {
    # No OS types specified
    
    # Unapproved zones
    zones = ["us-central1-a", "europe-west1-b"]
    
    # Instance filtering options
    instance_name_prefixes = ["web-"]
  }
  
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