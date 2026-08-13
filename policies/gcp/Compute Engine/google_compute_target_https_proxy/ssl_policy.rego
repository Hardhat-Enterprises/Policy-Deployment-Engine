package terraform.gcp.security.compute_engine.google_compute_target_https_proxy.ssl_policy

import data.terraform.gcp.security.compute_engine.google_compute_target_https_proxy.vars
import data.terraform.helpers

conditions := [
  [
    {
      "situation_description": "Target HTTPS proxy ssl_policy is not an approved SSL policy.",
      "remedies": [
        "Set ssl_policy to an explicitly approved SslPolicy resource.",
      ],
    },
    {
      "condition": "ssl_policy must be an approved SSL policy.",
      "attribute_path": ["ssl_policy"],
      "values": [
        "projects/approved-project/global/sslPolicies/approved-ssl-policy",
      ],
      "policy_type": "whitelist",
    },
  ],
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
