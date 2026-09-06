package terraform.gcp.security.compute_engine.google_compute_target_https_proxy.certificate_map

import data.terraform.gcp.security.compute_engine.google_compute_target_https_proxy.vars
import data.terraform.helpers

conditions := [
  [
    {
      "situation_description": "Target HTTPS proxy certificate_map is missing, so no certificate map is explicitly configured.",
      "remedies": [
        "Set certificate_map to the certificate map this proxy should use.",
      ],
    },
    {
      "condition": "certificate_map must not be empty or invalid.",
      "attribute_path": ["certificate_map"],
      "values": [null, "", "invalid-map"],
      "policy_type": "blacklist",
    },
  ],
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
