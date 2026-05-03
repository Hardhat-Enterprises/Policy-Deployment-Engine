resource "google_monitoring_uptime_check_config" "nc" {
  project      = "ecstatic-device-491708-g4"
  display_name = "nc"
  timeout      = "10s"
  period       = "300s"

  http_check {
    path         = "/"
    port         = 443
    use_ssl      = true
    validate_ssl = false
  }

  monitored_resource {
    type = "uptime_url"

    labels = {
      host       = "example.com"
      project_id = "ecstatic-device-491708-g4"
    }
  }
}
