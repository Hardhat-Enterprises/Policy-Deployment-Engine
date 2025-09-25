package terraform.gcp.security.dataproc_metastore.federation.deletion_protection

import data.terraform.gcp.helpers
import data.terraform.gcp.security.dataproc_metastore.federation.vars

conditions := [
  [
    {
      "situation_description": "Deletion protection is enabled, which may block necessary cleanup operations.",
      "remedies": ["Set deletion_protection to false to allow resources to be deleted when required."]
    },
    {
      "condition": "Checks that deletion_protection is disabled.",
      "attribute_path": ["deletion_protection"],
      "values": [false],
      "policy_type": "blacklist"
    }
  ]
]



message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details