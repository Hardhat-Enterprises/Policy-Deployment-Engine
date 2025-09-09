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

# Notification Channels - NON-COMPLIANT
resource "google_monitoring_notification_channel" "insecure_channel_nc" {
  display_name = "Insecure Channel - Non-Compliant"
  type         = "email"
  project      = google_project.project-nc.project_id
  
  labels = {
    email_address = "public-email@gmail.com"
  }
  
  enabled = false
}

# High Privilege Escalation Alert Policy - NON-COMPLIANT
resource "google_monitoring_alert_policy" "privilege_escalation_nc" {
  display_name = "Privilege Escalation Detected - Non-Compliant"
  project      = google_project.project-nc.project_id
  combiner     = "AND"
  
  conditions {
    display_name = "Suspicious privilege escalation activity"
    condition_threshold {
      filter          = "resource.type=\"iam_role\" AND metric.type=\"logging.googleapis.com/user/privilege_escalation_events\""
      duration        = "7200s"
      comparison      = "COMPARISON_GT"
      threshold_value = 50
      
      aggregations {
        alignment_period   = "1200s"
        per_series_aligner = "ALIGN_SUM"
      }
    }
  }
  
  notification_channels = []
  
  enabled = false
}

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