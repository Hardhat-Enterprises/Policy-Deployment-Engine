resource "google_monitoring_notification_channel" "nc" {
  project      = "ecstatic-device-491708-g4"
  display_name = "nc"
  type         = "pagerduty"
  labels = {
    channel_name = "example-channel"
    service_key  = "example-key"
  }
}
