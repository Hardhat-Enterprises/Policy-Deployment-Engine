resource "google_securityposture_posture" "compliant_example_1" {
  posture_id = "compliant_example_1"
  parent     = "organizations/1234567890"
  location   = "australia-southeast1"
  state      = "ACTIVE"

  policy_sets {
    policy_set_id = "example-policy-set"
    policies {
      policy_id = "example-policy"
      constraint {
        security_health_analytics_module {
          module_name             = "BIGQUERY_TABLE_CMEK_DISABLED"
          module_enablement_state = "ENABLED"
        }
      }
    }
  }
}
