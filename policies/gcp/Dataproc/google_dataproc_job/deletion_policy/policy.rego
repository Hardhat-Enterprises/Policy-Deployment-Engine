package terraform.gcp.security.dataproc.google_dataproc_job.deletion_policy

import data.terraform.helpers
import data.terraform.gcp.security.dataproc.google_dataproc_job.vars

conditions := [
  [
    {
      "situation_description": "deletion_policy is set to ABANDON, so Terraform removes the Dataproc job from state without deleting it through the API, leaving it unmanaged by Terraform",
      "remedies": ["Set deletion_policy to DELETE or PREVENT"]
    },
    {
      "condition": "deletion_policy must not be ABANDON",
      "attribute_path": ["deletion_policy"],
      "policy_type": "blacklist",
      "values": ["ABANDON"]
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
