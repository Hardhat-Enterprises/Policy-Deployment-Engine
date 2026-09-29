package terraform.gcp.security.cloud_security_compliance.google_cloud_security_compliance_framework_deployment.cloud_control_metadata_enforcement_mode

import data.terraform.helpers
import data.terraform.gcp.security.cloud_security_compliance.google_cloud_security_compliance_framework_deployment.vars

conditions := [
  [
    {
      "situation_description": "The Cloud Control is not configured for preventive enforcement.",
      "remedies": [
        "Set cloud_control_metadata.enforcement_mode to PREVENTIVE."
      ]
    },
    {
      "condition": "Cloud Control enforcement mode must be preventive",
      "attribute_path": ["cloud_control_metadata", 0, "enforcement_mode"],
      "values": ["PREVENTIVE"],
      "policy_type": "whitelist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details