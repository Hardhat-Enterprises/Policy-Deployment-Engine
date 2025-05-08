# Non-compliant OS Config Patch Deployment missing security updates
# This resource is missing security updates for Windows OS

resource "google_os_config_patch_deployment" "nc" {
  project = "pde-s224021028"
  patch_deployment_id = "patch-deploy-non-compliant"
  description         = "Non-compliant patch deployment missing security updates"
  
  instance_filter {
    all = true
  }
  
  patch_config {
    # Windows updates without SECURITY classification (non-compliant)
    windows_update {
      classifications = ["CRITICAL", "FEATURE_PACK"]
    }
    
    # Yum without security enabled (non-compliant)
    yum {
      security = false
      minimal = true
      excludes = ["bash-*"]
    }
    
    # Zypper without security category (non-compliant)
    zypper {
      categories = ["recommended", "optional"]
      severities = ["moderate", "low"]
    }
    
    # APT updates
    apt {
      type = "DIST"
      excludes = ["python-*"]
    }
    
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