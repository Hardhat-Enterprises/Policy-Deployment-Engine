package terraform.gcp.security.gke_hub.google_gke_hub_feature_membership.configmanagement_policy_controller_enabled
import data.terraform.helpers
import data.terraform.gcp.security.gke_hub.google_gke_hub_feature_membership.vars


conditions := [
  [
    {
      "situation_description": "Policy Controller is not enabled for this membership",
      "remedies": ["Set configmanagement.policy_controller.enabled should be = true" ]
    },
    {
      "condition": "policy_controller.enabled must be true",
      "attribute_path": ["configmanagement",0,"policy_controller",0,"enabled"],
      "values": [true],
      "policy_type": "whitelist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
