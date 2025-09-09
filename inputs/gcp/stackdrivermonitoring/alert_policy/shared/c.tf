# Shared resources for monitoring alerts - COMPLIANT

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

# Shared Notification Channels - COMPLIANT
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

resource "google_monitoring_notification_channel" "network_team_c" {
  display_name = "Network Team - Compliant"
  type         = "sms"
  project      = google_project.project-c.project_id
  
  labels = {
    number = "+1234567890"
  }
  
  enabled = true
}

resource "google_monitoring_notification_channel" "critical_alerts_c" {
  display_name = "Critical Security Alerts - Compliant"
  type         = "sms"
  project      = google_project.project-c.project_id
  
  labels = {
    number = "+1987654321"
  }
  
  enabled = true
}

resource "google_monitoring_notification_channel" "data_protection_c" {
  display_name = "Data Protection Team - Compliant"
  type         = "slack"
  project      = google_project.project-c.project_id
  
  labels = {
    channel_name = "#data-protection"
    url         = "https://hooks.slack.com/services/SECURE/WEBHOOK/DATA"
  }
  
  enabled = true
}

# Shared Access Boundary Policy - COMPLIANT
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