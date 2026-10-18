package terraform.gcp.security.compute_engine.google_compute_region_ssl_certificate.private_key

import data.terraform.gcp.security.compute_engine.google_compute_region_ssl_certificate.vars
import data.terraform.helpers

# private_key must be absent because Terraform can never fully protect a
# plaintext key defined inline. The secure alternative is private_key_wo, a
# write-only argument whose value is never exposed in planned_values or
# state, so no platform policy can inspect it — that invisibility is
# intentional and is why private_key_wo is security_impact: false.

conditions := [
  [
    {
      "situation_description": "When the private key is directly defined in Terraform, the SSL certificate may reveal critical key information.",
      "remedies": [
        "Remove private_key from the Terraform configuration and manage it via private_key_wo (write-only) or an external secret management process.",
      ],
    },
    {
      "condition": "private_key should not be defined directly in the resource.",
      "attribute_path": ["private_key"],
      "values": [null],
      "policy_type": "whitelist",
    },
  ],
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
