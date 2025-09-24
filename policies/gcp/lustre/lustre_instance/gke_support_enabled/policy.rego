package terraform.gcp.security.lustre.lustre_instance.gke_support_enabled

import data.terraform.gcp.helpers
import data.terraform.gcp.security.lustre.lustre_instance.vars

conditions := [
  [
    {
      "situation_description": "'gke_support_enabled' must be set to true to allow integration with GKE clients.",
      "remedies": [
        "Set 'gke_support_enabled' = true in the Lustre instance configuration."
      ]
    },
    {
      "condition": "'gke_support_enabled' is not enabled.",
      "attribute_path": ["gke_support_enabled"],
      "values": [true],
      "policy_type": "whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
