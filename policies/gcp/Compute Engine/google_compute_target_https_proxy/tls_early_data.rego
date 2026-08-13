package terraform.gcp.security.compute_engine.google_compute_target_https_proxy.tls_early_data

import data.terraform.gcp.security.compute_engine.google_compute_target_https_proxy.vars
import data.terraform.helpers

conditions := [
  [
    {
      "situation_description": "Target HTTPS proxy tls_early_data permits TLS 1.3 0-RTT (Early Data), which is vulnerable to replay attacks.",
      "remedies": [
        "Set tls_early_data to DISABLED to reject early data.",
      ],
    },
    {
      "condition": "tls_early_data must be DISABLED.",
      "attribute_path": ["tls_early_data"],
      "values": [
        "DISABLED",
      ],
      "policy_type": "whitelist",
    },
  ],
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
