resource "google_developer_connect_insights_config" "nc" {
  project            = "pde2025"
  location           = "us-central1"
  insights_config_id = "nc"

  app_hub_application = "//apphub.googleapis.com/projects/723741059731/locations/us-central1/applications/app2"
}
