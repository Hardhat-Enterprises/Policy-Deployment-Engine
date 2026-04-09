resource "google_developer_connect_insights_config" "c" {
  project            = "pde2025"
  location           = "australia-southeast1"
  insights_config_id = "c"

  app_hub_application = "//apphub.googleapis.com/projects/723741059731/locations/australia-southeast1/applications/app1"

  artifact_configs {
    uri = "australia-southeast1-docker.pkg.dev/pde2025/my-repo/my-image"

    google_artifact_analysis {
      project_id = "pde2025"
    }
    google_artifact_registry {
      project_id                = "pde2025"
      artifact_registry_package = "my-package"
    }
  }
}
