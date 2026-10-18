resource "google_ces_app" "non_compliant_example_1" {
  app_id      = "app-id"
  location    = "us"
  description = "Basic CES App example"
  display_name = "my-app"

  logging_settings {
    bigquery_export_settings {
      enabled = false
    }
  }
}