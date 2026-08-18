resource "google_monitoring_notification_channel" "compliant_example_1" {
  project      = "ecstatic-device-491708-g4"
  display_name = "compliant_example_1"
  type         = "pagerduty"
  labels = {
    channel_name = "example-channel"
  }
  sensitive_labels {
    service_key = "example-key"
  }
}
