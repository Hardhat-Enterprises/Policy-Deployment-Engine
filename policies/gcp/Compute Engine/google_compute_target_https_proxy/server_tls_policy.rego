package terraform.gcp.security.compute_engine.google_compute_target_https_proxy.server_tls_policy

import data.terraform.gcp.security.compute_engine.google_compute_target_https_proxy.vars
import data.terraform.helpers

conditions := [
  [
    {
      "situation_description": "Target HTTPS proxy server_tls_policy is missing or does not reference a ServerTlsPolicy.",
      "remedies": [
        "Set server_tls_policy to a valid path: projects/{project}/locations/global/serverTlsPolicies/{policy}",
      ],
    },
    {
      "condition": "server_tls_policy must not be empty or invalid.",
      "attribute_path": ["server_tls_policy"],
      "values": [null, "", "invalid-policy"],
      "policy_type": "blacklist",
    },
  ],
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
