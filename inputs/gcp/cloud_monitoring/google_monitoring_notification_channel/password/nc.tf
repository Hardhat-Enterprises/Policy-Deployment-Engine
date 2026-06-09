resource "google_monitoring_notification_channel" "nc" {
  project      = "ecstatic-device-491708-g4"
  display_name = "nc"
  type         = "webhook_basicauth"
  labels = {
    url      = "https://example.com"
    username = "example-user"
    password = "example-password"
  }
}
