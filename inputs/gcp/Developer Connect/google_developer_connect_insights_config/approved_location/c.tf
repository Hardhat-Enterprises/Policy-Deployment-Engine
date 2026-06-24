resource "google_developer_connect_insights_config" "c" {
  project            = "pde2025"
  location           = "australia-southeast1"
  insights_config_id = "c"

  app_hub_application = "//apphub.googleapis.com/projects/723741059731/locations/australia-southeast1/applications/app1"
}
