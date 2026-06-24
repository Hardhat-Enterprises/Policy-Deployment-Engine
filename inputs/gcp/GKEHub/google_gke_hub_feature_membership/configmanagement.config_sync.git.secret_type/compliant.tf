resource "google_gke_hub_feature_membership" "compliant_example_1" {
  location   = "global"
  feature    = "configmanagement"
  membership = "compliant_example_1"

  configmanagement {
    config_sync {
      enabled = true
      git {
        secret_type               = "gcpserviceaccount"         
        gcp_service_account_email = "example@orgdomain.com" 
      }
    }
  }
}

