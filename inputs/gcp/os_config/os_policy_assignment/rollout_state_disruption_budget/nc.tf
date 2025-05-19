# Non-compliant OS Config OS Policy Assignment without proper rollout configuration
# This resource is missing a rollout configuration

resource "google_os_config_os_policy_assignment" "nc" {
  project = "pde-s224021028"
  name        = "policy-assignment-non-compliant"
  description = "Non-compliant OS policy assignment missing rollout configuration"
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
      percent = 80  # Low disruption budget (10%)
    }
    
    min_wait_duration = "120s"  # 2 minutes between rollout steps
  }
  
  # Missing rollout block makes this resource non-compliant
  # Without a controlled rollout strategy, the policy could be applied too aggressively
  # potentially causing disruption to many instances at once
}