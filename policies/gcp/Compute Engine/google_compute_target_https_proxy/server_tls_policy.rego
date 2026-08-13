package terraform.gcp.security.compute_engine.google_compute_target_https_proxy.server_tls_policy

import data.terraform.gcp.security.compute_engine.google_compute_target_https_proxy.vars
import data.terraform.helpers

conditions := [
  [
    {
      "situation_description": "Target HTTPS proxy server_tls_policy is not an approved TLS policy.",
      "remedies": [
        "Set server_tls_policy to an explicitly approved networksecurity.ServerTlsPolicy resource.",
      ],
    },
    {
      "condition": "server_tls_policy must be an approved TLS policy.",
      "attribute_path": ["server_tls_policy"],
      "values": [
        "projects/approved-project/locations/global/serverTlsPolicies/approved-policy",
      ],
      "policy_type": "whitelist",
    },
  ],
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
