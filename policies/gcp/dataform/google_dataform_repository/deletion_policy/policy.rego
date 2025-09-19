package terraform.gcp.security.dataform.google_dataform_repository.deletion_policy

import data.terraform.gcp.helpers
import data.terraform.gcp.security.dataform.google_dataform_repository.vars

conditions := [
  [
    {
      "situation_description": "Dataform repository deletion_policy cannot be FORCE - this is dangerous and may cause data loss.",
      "remedies": [
        "Use DELETE instead of FORCE deletion policy.",
        "Ensure proper data protection and safe deletion practices."
      ]
    },
    {
      "condition": "deletion_policy must not be FORCE",
      "attribute_path": ["deletion_policy"],
      "values": ["FORCE"],
      "policy_type": "blacklist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
