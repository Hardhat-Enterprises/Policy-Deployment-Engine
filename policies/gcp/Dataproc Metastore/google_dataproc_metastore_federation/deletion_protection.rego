package terraform.gcp.security.dataproc_metastore.google_dataproc_metastore_federation.deletion_protection

import data.terraform.helpers
import data.terraform.gcp.security.dataproc_metastore.google_dataproc_metastore_federation.vars

conditions := [
  [
    {
      "situation_description": "Deletion protection is enabled, which may block necessary cleanup operations.",
      "remedies": ["Set deletion_protection to false to allow resources to be deleted when required."]
    },
    {
      "condition": "Checks that deletion_protection is disabled.",
      "attribute_path": ["deletion_protection"],
      "values": [true],
      "policy_type": "blacklist"
    }
  ]
]



result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details