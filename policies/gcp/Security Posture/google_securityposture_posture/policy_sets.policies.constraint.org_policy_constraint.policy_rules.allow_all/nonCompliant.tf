resource "google_securityposture_posture" "non_compliant_example_1" {
  posture_id  = "non_compliant_example_1"
  parent      = "organizations/1234567890"
  location    = "australia-southeast1"
  state       = "ACTIVE"

  policy_sets {
    policy_set_id = "example-policy-set"
    policies {
      policy_id = "example-policy"
      constraint {
        org_policy_constraint {
          canned_constraint_id = "storage.uniformBucketLevelAccess"
          policy_rules {
            enforce = true
            allow_all = true
          }
        }
      }
    }
  }
}
