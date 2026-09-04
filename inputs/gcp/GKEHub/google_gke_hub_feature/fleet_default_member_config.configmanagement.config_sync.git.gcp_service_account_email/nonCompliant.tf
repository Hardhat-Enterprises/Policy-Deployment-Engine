resource "google_gke_hub_feature" "non_compliant_example_1" {
  name     = "non_compliant_example_1"
  location = "global"
  project  = "1234"

  fleet_default_member_config {
    configmanagement {
      config_sync {
        source_format = "unstructured"

        git {
          sync_repo                 = "https://github.com/example/config-repo"
          secret_type               = "gcpserviceaccount"
          gcp_service_account_email = "unapproved-account@example.com"
        }
      }
    }
  }
}