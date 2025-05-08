# Non-compliant OS Config Patch Deployment with issues in reboot configuration
# This resource has multiple compliance issues:
# 1. Uses an invalid reboot_config value
# 2. Production environment using ALWAYS reboot config which could cause disruption

resource "google_os_config_patch_deployment" "nc" {
  project = "pde-s224021028"
  patch_deployment_id = "prod-security-001"
  description         = "Non-compliant patch deployment with reboot configuration issues"
  
  instance_filter {
    all = true
  }
  
  patch_config {
    apt {
      type = "DIST"
      excludes = ["python-*"]
    }
    
    yum {
      security = true
      minimal = true
      excludes = ["bash-*"]
    }
    
    # Non-compliant: Production deployment with ALWAYS reboot setting
    # This will cause disruption to production systems
    reboot_config = "ALWAYS"
    
    windows_update {
      classifications = ["CRITICAL", "SECURITY"]
    }
  }
  
  recurring_schedule {
    time_zone {
      id = "Australia/Melbourne"
    }
    
    time_of_day {
      hours = 2
      minutes = 30
      seconds = 0
      nanos = 0
    }
    
    weekly {
      day_of_week = "MONDAY"
    }
  }
}