# Compliant OS Config OS Policy Assignment with proper rollout configuration
# This resource has a controlled rollout strategy with reasonable disruption budget

resource "google_os_config_os_policy_assignment" "c" {
  project = "pde-s224021028"
  name        = "policy-assignment-compliant"
  description = "Compliant OS policy assignment with proper rollout configuration"
  location    = "australia-southeast2"
  
  instance_filter {
    all = true
  }
  
  os_policies {
    id   = "policy1"
    mode = "ENFORCEMENT"
    
    resource_groups {
      resources {
        id = "install-pkg"
        
        pkg {
          desired_state = "INSTALLED"
          apt {
            name = "nginx"
          }
        }
      }
    }
  }
  
  rollout {
    disruption_budget {
      percent = 10  # Low disruption budget (10%)
    }
    
    min_wait_duration = "300s"  # 5 minutes between rollout steps
  }
  
  # Proper rollout configuration with reasonable disruption budget and wait duration
  # makes this resource compliant
}