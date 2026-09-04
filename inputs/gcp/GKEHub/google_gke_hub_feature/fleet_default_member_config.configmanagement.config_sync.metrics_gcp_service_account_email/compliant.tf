resource "google_gke_hub_feature" "compliant_example_1" {
  name     = "compliant_example_1"
  location = "global"
  project  = "1234"

  fleet_default_member_config {
    configmanagement {
      config_sync {
        metrics_gcp_service_account_email = "config-sync-metrics@approved-project.iam.gserviceaccount.com"
      }
    }
  }
}