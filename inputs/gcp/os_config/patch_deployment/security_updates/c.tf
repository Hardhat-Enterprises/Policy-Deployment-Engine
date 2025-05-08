# Compliant OS Config Patch Deployment with security updates
# This resource properly includes security updates for each OS type

resource "google_os_config_patch_deployment" "c" {
  project = "pde-s224021028"
  patch_deployment_id = "patch-deploy-compliant"
  description         = "Compliant patch deployment with security updates"
  
  instance_filter {
    all = true
  }
  
  patch_config {
    # Windows updates with SECURITY classification
    windows_update {
      classifications = ["CRITICAL", "SECURITY"]
    }
    
    # Yum with security enabled
    yum {
      security = true
      minimal = false
      excludes = ["kernel-devel*"]
    }
    
    # Zypper with security category
    zypper {
      categories = ["security", "recommended"]
      severities = ["critical", "important"]
    }
    
    # APT updates
    apt {
      type = "DIST"
      excludes = ["python-*"]
    }
    
    # Config is defined
    reboot_config = "DEFAULT"
  }
  
  recurring_schedule {
    time_zone {
      id = "Australia/Melbourne"
    }
    
    time_of_day {
      hours = 22
      minutes = 30
      seconds = 0
      nanos = 0
    }
    
    weekly {
      day_of_week = "SUNDAY"
    }
  }
}