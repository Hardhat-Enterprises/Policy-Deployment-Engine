package terraform.gcp.security.cloud_security_compliance.google_cloud_security_compliance_framework_deployment.deletion_policy

import data.terraform.helpers
import data.terraform.gcp.security.cloud_security_compliance.google_cloud_security_compliance_framework_deployment.vars

conditions := [
  [
    {
      "situation_description": "The compliance framework deployment is not protected from deletion.",
      "remedies": [
        "Set deletion_policy to PREVENT to protect the framework deployment from accidental or unauthorised deletion."
      ]
    },
    {
      "condition": "deletion_policy must prevent deletion",
      "attribute_path": ["deletion_policy"],
      "values": ["PREVENT"],
      "policy_type": "whitelist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details