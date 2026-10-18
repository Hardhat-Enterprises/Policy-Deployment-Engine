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
        org_policy_constraint_custom {
          custom_constraint {
            name           = "custom.exampleConstraint"
            display_name   = "Example"
            action_type    = "DENY"
            condition      = "resource.name != \"\""
            method_types   = ["CREATE"]
            resource_types = ["compute.googleapis.com/Instance"]
          }
          policy_rules {
            allow_all = true
          }
        }
      }
    }
  }
}
