resource "google_gke_hub_feature" "non_compliant_example_1" {
  name     = "non_compliant_example_1"
  location = "global"
  project  = "1234"

  fleet_default_member_config {
    policycontroller {
      policy_controller_hub_config {
        install_spec       = "INSTALL_SPEC_ENABLED"
        log_denies_enabled = false
      }
    }
  }
}