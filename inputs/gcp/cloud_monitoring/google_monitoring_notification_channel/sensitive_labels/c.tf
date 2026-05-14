resource "google_monitoring_notification_channel" "c" {
  project      = "ecstatic-device-491708-g4"
  display_name = "c"
  type         = "slack"

  labels = {
    channel_name = "#alerts"
  }

  sensitive_labels {
    auth_token = "example-token"
  }
}
