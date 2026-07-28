resource "google_gke_hub_feature_membership" "non_compliant_example_1" {
  location   = "global"
  feature    = "configmanagement"
  membership = "non_compliant_example_1"

  configmanagement {
    policy_controller {
      enabled = false
    }
  }
}

