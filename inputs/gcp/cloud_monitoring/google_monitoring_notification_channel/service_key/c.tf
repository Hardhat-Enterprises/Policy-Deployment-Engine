resource "google_monitoring_notification_channel" "c" {
  project      = "ecstatic-device-491708-g4"
  display_name = "c"
  type         = "pagerduty"
  labels = {
    channel_name = "example-channel"
  }
  sensitive_labels {
    service_key = "example-key"
  }
}
