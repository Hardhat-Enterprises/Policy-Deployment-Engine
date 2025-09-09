# Complete configuration for Unauthorized API Access Alert - COMPLIANT

# Foundation Resources - COMPLIANT
resource "google_project" "project-c" {
  project_id      = "my-monitoring-project"
  name            = "my-monitoring-project"
  org_id          = "123456789"
  billing_account = "000000-0000000-0000000-000000"
  deletion_policy = "DELETE"
}

resource "google_access_context_manager_access_policy" "access-policy-c" {
  parent = "organizations/${google_project.project-c.org_id}"
  title  = "monitoring policy"
}

resource "google_access_context_manager_access_level" "monitoring-access-c" {
  parent = "accessPolicies/${google_access_context_manager_access_policy.access-policy-c.name}"
  name   = "accessPolicies/${google_access_context_manager_access_policy.access-policy-c.name}/accessLevels/secure_monitoring_access"
  title  = "secure_monitoring_access"
  basic {
    conditions {
      device_policy {
        require_screen_lock = true
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

# Notification Channels - COMPLIANT
resource "google_monitoring_notification_channel" "security_team_c" {
  display_name = "Security Team - Compliant"
  type         = "email"
  project      = google_project.project-c.project_id
  
  labels = {
    email_address = "security-team@company.com"
  }
  
  enabled = true
}

resource "google_monitoring_notification_channel" "ops_team_c" {
  display_name = "Operations Team - Compliant"
  type         = "slack"
  project      = google_project.project-c.project_id
  
  labels = {
    channel_name = "#security-alerts"
    url         = "https://hooks.slack.com/services/SECURE/WEBHOOK/URL"
  }
  
  enabled = true
}

# Unauthorized API Access Alert Policy - COMPLIANT
resource "google_monitoring_alert_policy" "unauthorized_api_access_c" {
  display_name = "Unauthorized API Access Detected - Compliant"
  project      = google_project.project-c.project_id
  combiner     = "OR"
  
  conditions {
    display_name = "Unauthorized API calls detected"
    condition_threshold {
      filter          = "resource.type=\"api\" AND metric.type=\"logging.googleapis.com/user/unauthorized_api_calls\""
      duration        = "120s"
      comparison      = "COMPARISON_GT"
      threshold_value = 5
      
      aggregations {
        alignment_period   = "60s"
        per_series_aligner = "ALIGN_RATE"
        cross_series_reducer = "REDUCE_SUM"
        group_by_fields = ["resource.labels.service"]
      }
    }
  }
  
  notification_channels = [
    google_monitoring_notification_channel.security_team_c.name,
    google_monitoring_notification_channel.ops_team_c.name
  ]
  
  alert_strategy {
    auto_close = "86400s"
    notification_rate_limit {
      period = "300s"
    }
  }
  
  enabled = true
  
  documentation {
    content = "Critical security alert for unauthorized API access attempts. Immediate investigation required."
    mime_type = "text/markdown"
  }
}

resource "google_iam_access_boundary_policy" "c" {
  name   = "monitoring-abp-c"
  parent = "organizations/${google_project.project-c.org_id}"
  
  rules {
    description = "Secure access boundary for monitoring resources"
    access_boundary_rule {
      available_resource    = "//cloudresourcemanager.googleapis.com/projects/${google_project.project-c.project_id}"
      available_permissions = [
        "monitoring.alertPolicies.get",
        "monitoring.alertPolicies.list",
        "monitoring.notificationChannels.get"
      ]
      availability_condition {
        expression  = "request.matchAccessLevels('${google_project.project-c.org_id}', ['${google_access_context_manager_access_level.monitoring-access-c.name}'])"
        title       = "Secure monitoring access condition"
        description = "Ensures monitoring access only from compliant devices and locations"
        location    = ""
      }
    }
  }
  
  display_name = "Monitoring Security Boundary Policy"
}