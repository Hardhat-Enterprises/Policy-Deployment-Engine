resource "google_gke_hub_feature_membership" "nc" {
  location   = "global"
  feature    = "configmanagement"
  membership = "membership-nc"

  configmanagement {
    config_sync {
      enabled = true
      git {
        policy_dir  = "project/main"
      }
    }
  }
}




