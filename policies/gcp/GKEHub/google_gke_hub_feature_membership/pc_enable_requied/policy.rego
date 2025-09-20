package terraform.gcp.security.gke_hub.google_gke_hub_feature_membership.pc_enabled_required
import data.terraform.gcp.helpers
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

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
