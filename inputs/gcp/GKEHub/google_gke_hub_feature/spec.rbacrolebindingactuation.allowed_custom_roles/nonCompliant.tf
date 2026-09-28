resource "google_gke_hub_feature" "non_compliant_example_1" {
  name     = "non_compliant_example_1"
  location = "global"
  project  = "1234"

  spec {
    rbacrolebindingactuation {
      allowed_custom_roles = ["cluster-admin"]
    }
  }
}