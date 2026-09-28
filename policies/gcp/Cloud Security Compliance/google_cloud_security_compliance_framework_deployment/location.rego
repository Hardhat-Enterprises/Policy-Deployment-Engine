package terraform.gcp.security.cloud_security_compliance.google_cloud_security_compliance_framework_deployment.location

import data.terraform.helpers as helpers
import data.terraform.gcp.security.cloud_security_compliance.google_cloud_security_compliance_framework_deployment.vars as vars

conditions := [
  [
    {
      "situation_description": "Framework deployment location must be in an approved Australia region allowlist.",
      "remedies": [
        "Use one of: australia-southeast1, australia-southeast2."
      ],
    },
    {
      "condition": "Location must be on the approved region allowlist.",
      "attribute_path": ["location"],
      "values": ["australia-southeast1", "australia-southeast2"],
      "policy_type": "whitelist",
    },
  ],
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details