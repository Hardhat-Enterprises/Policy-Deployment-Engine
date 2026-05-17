resource "google_monitoring_notification_channel" "c" {
  project      = "ecstatic-device-491708-g4"
  display_name = "c"
  type         = "webhook_basicauth"
  labels = {
    url      = "https://example.com"
    username = "example-user"
  }
  sensitive_labels {
    password = "example-password"
  }
}
