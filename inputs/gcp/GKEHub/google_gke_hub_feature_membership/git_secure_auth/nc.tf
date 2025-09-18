resource "google_gke_hub_feature_membership" "nc" {
  location   = "global"
  feature    = "configmanagement"
  membership = "nc"

  configmanagement {
    config_sync {
      enabled = true
      git {
        secret_type               = "none"         
        gcp_service_account_email = "random@domain.com"              
      }
    }
  }
}
