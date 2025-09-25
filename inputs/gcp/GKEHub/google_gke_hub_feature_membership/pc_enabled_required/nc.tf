resource "google_gke_hub_feature_membership" "nc" {
  location   = "global"
  feature    = "configmanagement"
  membership = "nc"

  configmanagement {
    policy_controller {
      enabled = false
    }
  }
}

