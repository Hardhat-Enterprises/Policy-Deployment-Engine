resource "google_monitoring_notification_channel" "non_compliant_example_1" {
  project      = "ecstatic-device-491708-g4"
  display_name = "non_compliant_example_1"
  type         = "slack"
  labels = {
    channel_name = "#alerts"
    auth_token   = "example-token"
  }
}
