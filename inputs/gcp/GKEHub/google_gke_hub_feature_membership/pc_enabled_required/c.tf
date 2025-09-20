resource "google_gke_hub_feature_membership" "c" {
  location   = "global"
  feature    = "configmanagement"
  membership = "c"

  configmanagement {
    policy_controller {
      enabled = true
    }
  }
}


