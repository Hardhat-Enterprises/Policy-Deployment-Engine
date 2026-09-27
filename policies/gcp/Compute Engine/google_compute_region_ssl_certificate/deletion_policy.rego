package terraform.gcp.security.compute_engine.google_compute_region_ssl_certificate.deletion_policy

import data.terraform.gcp.security.compute_engine.google_compute_region_ssl_certificate.vars
import data.terraform.helpers

conditions := [
  [
    {
      "situation_description": "SSL certificate deletion_policy does not prevent accidental deletion.",
      "remedies": [
        "Set deletion_policy to PREVENT to avoid accidental deletion of the certificate.",
      ],
    },
    {
      "condition": "deletion_policy must be PREVENT.",
      "attribute_path": ["deletion_policy"],
      "values": [
        "PREVENT",
      ],
      "policy_type": "whitelist",
    },
  ],
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
