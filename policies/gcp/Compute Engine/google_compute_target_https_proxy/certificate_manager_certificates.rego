package terraform.gcp.security.compute_engine.google_compute_target_https_proxy.certificate_manager_certificates

import data.terraform.gcp.security.compute_engine.google_compute_target_https_proxy.vars
import data.terraform.helpers

conditions := [
  [
    {
      "situation_description": "Target HTTPS proxy certificate_manager_certificates is empty, so no certificate is explicitly configured.",
      "remedies": [
        "Set certificate_manager_certificates to the certificate manager certificate(s) this proxy should use.",
      ],
    },
    {
      "condition": "certificate_manager_certificates must not be empty or invalid.",
      "attribute_path": ["certificate_manager_certificates"],
      "values": [null, [], "invalid-certificate"],
      "policy_type": "blacklist",
    },
  ],
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
