resource "google_developer_connect_insights_config" "nc" {
  project            = "pde2025"
  location           = "australia-southeast1"
  insights_config_id = "nc"

  app_hub_application = "//apphub.googleapis.com/projects/999999999999/locations/us-central1/applications/app2"

  artifact_configs {
    uri = "us-docker.pkg.dev/otherproj/not-allowed-repo/not-allowed-image"

    google_artifact_analysis {
      project_id = "otherproj"
    }
    google_artifact_registry {
      project_id                = "otherproj"
      artifact_registry_package = "not-allowed"
    }
  }
}
