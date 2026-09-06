package terraform.gcp.security.compute_engine.google_compute_target_https_proxy.ssl_policy

import data.terraform.gcp.security.compute_engine.google_compute_target_https_proxy.vars
import data.terraform.helpers

conditions := [
  [
    {
      "situation_description": "Target HTTPS proxy ssl_policy is missing or does not reference an approved SslPolicy.",
      "remedies": [
        "Set ssl_policy to a valid path: projects/{project}/global/sslPolicies/{policy}",
      ],
    },
    {
      "condition": "ssl_policy must not be empty or invalid.",
      "attribute_path": ["ssl_policy"],
      "values": [null, "", "invalid-policy"],
      "policy_type": "blacklist",
    },
    {
      "condition": "ssl_policy must follow approved project/policy pattern.",
      "attribute_path": ["ssl_policy"],
      "values": [
        "projects/*/global/sslPolicies/*",
        [
          ["project-1", "project-2"],
          ["policy-1", "policy-2"],
        ],
      ],
      "policy_type": "pattern whitelist",
    },
  ],
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
