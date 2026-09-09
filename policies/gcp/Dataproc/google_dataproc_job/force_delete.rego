package terraform.gcp.security.dataproc.google_dataproc_job.force_delete

import data.terraform.helpers
import data.terraform.gcp.security.dataproc.google_dataproc_job.vars

conditions := [
  [
    {
      "situation_description": "force_delete is set to true, allowing Terraform to cancel an active Dataproc job before deleting it instead of preserving the default restriction to inactive jobs",
      "remedies": ["Set force_delete to false or remove the attribute"]
    },
    {
      "condition": "force_delete must not be true",
      "attribute_path": ["force_delete"],
      "policy_type": "whitelist",
      "values": [false]
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
