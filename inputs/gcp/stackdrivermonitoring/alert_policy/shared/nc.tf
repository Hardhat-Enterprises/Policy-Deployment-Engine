# Shared resources for monitoring alerts - NON-COMPLIANT

# Foundation Resources - NON-COMPLIANT
resource "google_project" "project-nc" {
  project_id      = "my-monitoring-project"
  name            = "my-monitoring-project"
  org_id          = "123456789"
  billing_account = "000000-0000000-0000000-000000"
  deletion_policy = "DELETE"
}

resource "google_access_context_manager_access_policy" "access-policy-nc" {
  parent = "organizations/${google_project.project-nc.org_id}"
  title  = "monitoring policy"
}

resource "google_access_context_manager_access_level" "monitoring-access-nc" {
  parent = "accessPolicies/${google_access_context_manager_access_policy.access-policy-nc.name}"
  name   = "accessPolicies/${google_access_context_manager_access_policy.access-policy-nc.name}/accessLevels/insecure_monitoring_access"
  title  = "insecure_monitoring_access"
  basic {
    conditions {
      device_policy {
        require_screen_lock = false
        os_constraints {
          os_type = "DESKTOP_CHROME_OS"
        }
      }
      regions = [
        "CH",
        "IT", 
        "US",
      ]
    }
  }
}

# Shared Notification Channels - NON-COMPLIANT
resource "google_monitoring_notification_channel" "insecure_channel_nc" {
  display_name = "Insecure Channel - Non-Compliant"
  type         = "email"
  project      = google_project.project-nc.project_id
  
  labels = {
    email_address = "public-email@gmail.com"
  }
  
  enabled = false
}

resource "google_monitoring_notification_channel" "unreliable_channel_nc" {
  display_name = "Unreliable Channel - Non-Compliant"
  type         = "slack"
  project      = google_project.project-nc.project_id
  
  labels = {
    channel_name = ""
    url         = "http://insecure-webhook.com"
  }
  
  enabled = false
}

resource "google_monitoring_notification_channel" "broken_channel_nc" {
  display_name = "Broken Channel - Non-Compliant"
  type         = "sms"
  project      = google_project.project-nc.project_id
  
  labels = {
    number = "000-000-0000"
  }
  
  enabled = false
}

# Shared Access Boundary Policy - NON-COMPLIANT
resource "google_iam_access_boundary_policy" "nc" {
  name   = "monitoring-abp-nc"
  parent = ""
  
  rules {
    description = ""
    access_boundary_rule {
      available_resource    = ""
      available_permissions = [""]
      availability_condition {
        expression  = ""
        title       = ""
        description = ""
        location    = ""
      }
    }
  }
  
  display_name = ""
}