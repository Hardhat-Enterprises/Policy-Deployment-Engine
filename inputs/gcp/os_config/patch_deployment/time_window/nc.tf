# Non-compliant OS Config Patch Deployment with time window issues
# This resource is scheduled during business hours (8AM-5PM)

resource "google_os_config_patch_deployment" "nc" {
  project = "pde-s224021028"
  patch_deployment_id = "patch-deploy-non-compliant"
  description         = "Non-compliant patch deployment scheduled during business hours"
  
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
    
    windows_update {
      classifications = ["CRITICAL", "SECURITY"]
    }
    
    reboot_config = "DEFAULT"
  }
  
  recurring_schedule {
    # Proper time zone specification
    time_zone {
      id = "USA/New York"
    }
    
    # Non-compliant: Scheduled at 10:00 AM (during business hours 8AM-5PM)
    time_of_day {
      hours = 10
      minutes = 0
      seconds = 0
      nanos = 0
    }
    
    weekly {
      day_of_week = "TUESDAY"
    }
  }
}