resource "google_gke_hub_feature_membership" "non_compliant_example_1" {
  location   = "global"
  feature    = "configmanagement"
  membership = "non_compliant_example_1"

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
