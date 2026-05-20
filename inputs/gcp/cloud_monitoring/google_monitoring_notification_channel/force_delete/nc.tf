resource "google_monitoring_notification_channel" "nc" {
  project      = "ecstatic-device-491708-g4"
  display_name = "nc"
  type         = "slack"

  labels = {
    channel_name = "#alerts"
  }

  force_delete = true
}
