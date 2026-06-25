resource "google_monitoring_notification_channel" "compliant_example_1" {
  project      = "ecstatic-device-491708-g4"
  display_name = "compliant_example_1"
  type         = "webhook_basicauth"
  labels = {
    url      = "https://example.com"
    username = "example-user"
  }
  sensitive_labels {
    password = "example-password"
  }
}
