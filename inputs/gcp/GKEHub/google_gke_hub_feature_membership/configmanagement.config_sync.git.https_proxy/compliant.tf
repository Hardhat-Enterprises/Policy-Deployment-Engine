resource "google_gke_hub_feature_membership" "compliant_example_1" {
  location   = "global"
  feature    = "configmanagement"
  membership = "compliant_example_1"

  configmanagement {
    config_sync {
      enabled = true
      git {
        https_proxy = "https://proxy.yourcompany.com" 
      }
    }
  }
}

