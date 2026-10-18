resource "google_securityposture_posture" "non_compliant_example_1" {
  posture_id = "non_compliant_example_1"
  parent     = "organizations/1234567890"
  location   = "australia-southeast1"
  state      = "ACTIVE"

  policy_sets {
    policy_set_id = "example-policy-set"
    policies {
      policy_id = "example-policy"
      constraint {
        security_health_analytics_custom_module {
          display_name            = "exampleModule"
          module_enablement_state = "DISABLED"
          config {
            severity    = "HIGH"
            description = "example"
            recommendation = "example"
            predicate {
              expression = "true"
            }
            resource_selector {
              resource_types = ["compute.googleapis.com/Instance"]
            }
            custom_output {}
          }
        }
      }
    }
  }
}
