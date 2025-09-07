resource "google_gke_hub_feature_membership" "c" {
  location   = "global"
  feature    = "configmanagement"
  membership = "membership-c"

  configmanagement {
    config_sync {
      enabled = true
      git {
        policy_dir  = "project/test"
      }
    }
  }
}


