# Compliant OS Config Patch Deployment with proper time window
# This resource schedules patch deployment outside of business hours

resource "google_os_config_patch_deployment" "c" {
  project = "pde-s224021028"
  patch_deployment_id = "patch-deploy-compliant"
  description         = "Compliant patch deployment outside of business hours"
  
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
    
    goo {
      enabled = true
    }
    
    zypper {
      categories = ["security"]
    }
    
    windows_update {
      classifications = ["CRITICAL", "SECURITY"]
    }
    
    reboot_config = "DEFAULT"
  }
  
  recurring_schedule {
    # Proper time zone specification
    time_zone {
      id = "Australia/Melbourne"
    }
    
    # Compliant: Scheduled at 6:30 PM (after business hours)
    time_of_day {
      hours = 18
      minutes = 30
      seconds = 0
      nanos = 0
    }
    
    weekly {
      day_of_week = "MONDAY"
    }
  }
}