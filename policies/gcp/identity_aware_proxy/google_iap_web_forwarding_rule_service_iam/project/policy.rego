package terraform.gcp.security.identity_aware_proxy.google_iap_web_forwarding_rule_service_iam.project

import data.terraform.gcp.helpers
import data.terraform.gcp.security.identity_aware_proxy.google_iap_web_forwarding_rule_service_iam as vars

# Security goals:
# - Bind IAP only in approved projects following org naming.
# - Explicitly block sandbox/test/poc/demo projects.

conditions := [
  [
    {"situation_description": "IAP forwarding-rule bindings must be in approved projects",
     "remedies": ["Create/rename project to approved pattern or request exception"]},
    {
      "condition": "project must match approved naming",
      "attribute_path": ["project"],
      "values": [
        "*-*-*",
        [
          ["corp","platform","retail","ops"],         # orgs
          ["orders","payments","inventory","pos","reporting","loyalty","kitchen"],
          ["dev","stg","prod"]                        # envs
        ]
      ],
      "policy_type": "pattern whitelist"
    }
  ],
  [
    {"situation_description": "IAP must not be bound in sandbox/test/poc projects",
     "remedies": ["Remove binding or move workload to approved project"]},
    {
      "condition": "project must not be sandbox/test/poc/demo",
      "attribute_path": ["project"],
      "values": [
        "*-*-*",
        [
          ["sandbox","playground"],   # disallowed org slot
          [],                         # no blocklist for workload slot
          ["test","tests","poc","demo","devtmp"]  # disallowed env slot
        ]
      ],
      "policy_type": "pattern blacklist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
