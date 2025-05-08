# Non-compliant OS Config Patch Deployment with tagging issues
# This resource has multiple compliance issues:
# 1. Missing description
# 2. Invalid patch_deployment_id format
# 3. Using 'default' as project value

resource "google_os_config_patch_deployment" "nc" {
  project = "default"  # Non-compliant: Using default project instead of explicit project
  patch_deployment_id = "invalid_name"  # Non-compliant: Does not follow required format
  description = ""  # Non-compliant: Empty description
  
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
      minimal = false
      excludes = ["kernel-devel*"]
    }
    
    windows_update {
      classifications = ["CRITICAL", "SECURITY"]
    }
    
    reboot_config = "DEFAULT"
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
      day_of_week = "SUNDAY"
    }
  }
}