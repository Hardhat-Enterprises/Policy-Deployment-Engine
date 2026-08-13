package terraform.gcp.security.compute_engine.google_compute_region_ssl_certificate.certificate

import data.terraform.gcp.security.compute_engine.google_compute_region_ssl_certificate.vars
import data.terraform.helpers

conditions := [
  [
    {
      "situation_description": "Certificate is a known placeholder/test value rather than a real deployment-specific certificate.",
      "remedies": [
        "Replace the placeholder certificate with the actual PEM certificate for this deployment, sourced from a secret manager or file reference rather than hardcoded inline.",
      ],
    },
    {
      "condition": "certificate must not be a known placeholder value.",
      "attribute_path": ["certificate"],
      "values": [
        "-----BEGIN CERTIFICATE-----\ndummy-certificate-content\n-----END CERTIFICATE-----\n",
      ],
      "policy_type": "blacklist",
    },
  ],
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
