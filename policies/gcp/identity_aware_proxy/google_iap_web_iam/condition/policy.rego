package terraform.gcp.security.identity_aware_proxy.google_iap_web_iam.condition

import data.terraform.gcp.helpers
import data.terraform.gcp.security.identity_aware_proxy.google_iap_web_iam as vars

# Enforce: every IAP Web IAM binding must include a non-empty 'condition' block.
# Note: In the Terraform plan, a missing block appears as [] (empty list).

conditions := [
  [
    {"situation_description": "IAP Web IAM bindings must be conditional",
     "remedies": ["Add an IAM Condition (CEL) scoping host/path/time/device"]},
    {
      "condition": "condition block must exist and be non-empty",
      "attribute_path": ["condition"],
      # Catch both representations of 'missing':
      # - null (truly missing key) and
      # - [] (present but empty list, typical for TF plans)
      "values": [null, []],
      "policy_type": "blacklist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
