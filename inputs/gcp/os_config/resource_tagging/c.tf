# Compliant OS Config Patch Deployment with proper tagging
# This resource has all required tags and follows naming conventions

resource "google_os_config_patch_deployment" "c" {
  project = "pde-s224021028"  # Explicit project specified (not default)
  patch_deployment_id = "prod-security-001"  # Valid format: env-purpose-id
  description = "Production security patch deployment for critical systems"  # Non-empty description
  
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