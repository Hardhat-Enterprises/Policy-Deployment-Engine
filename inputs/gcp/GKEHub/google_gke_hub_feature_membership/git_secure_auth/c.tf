resource "google_gke_hub_feature_membership" "c" {
  location   = "global"
  feature    = "configmanagement"
  membership = "c"

  configmanagement {
    config_sync {
      enabled = true
      git {
        secret_type               = "gcp_service_account_email"         
        gcp_service_account_email = "example@orgdomain.com" 
      }
    }
  }
}


