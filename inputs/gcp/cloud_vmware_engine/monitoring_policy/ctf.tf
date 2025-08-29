provider "google" {
  project = var.project_id
  region  = "australia-southeast1"   
}

resource "google_project_service" "monitoring" {
  project = var.project_id
  service = "monitoring.googleapis.com"
}


resource "google_monitoring_notification_channel" "email" {
  project      = var.project_id
  display_name = "Admin Email Alert"
  type         = "email"
  labels = {
    email_address = "rsb132500000@gmail.com"
  }
}

resource "google_monitoring_uptime_check_config" "http_check" {
  project      = var.project_id
  display_name = "vmwareengine-http-check"
  monitored_resource {
    type   = "uptime_url"
    labels = {
      host = "example.com"
    }
  }
  http_check {
    path   = "/"
    port   = 443
    use_ssl = true
  }
  timeout  = "10s"
  period   = "60s"
}

resource "google_monitoring_alert_policy" "uptime_alert" {
  project      = var.project_id
  display_name = "VMwareEngine Uptime Alert"
  combiner     = "OR"
  conditions {
    display_name = "Uptime Check Failure"
    condition_threshold {
      filter          = "metric.type=\"monitoring.googleapis.com/uptime_check/check_passed\" AND resource.type=\"uptime_url\""
      comparison      = "COMPARISON_LT"
      threshold_value = 1
      duration        = "60s"
      trigger {
        count = 1
      }
    }
  }
  notification_channels = [google_monitoring_notification_channel.email.id]
}
