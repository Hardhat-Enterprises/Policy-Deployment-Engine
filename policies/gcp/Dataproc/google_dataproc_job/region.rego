package terraform.gcp.security.dataproc.google_dataproc_job.region

import data.terraform.helpers
import data.terraform.gcp.security.dataproc.google_dataproc_job.vars

conditions := [
  [
    {
      "situation_description": "Dataproc job is submitted in an unapproved region.",
      "remedies": ["Use an approved region for the Dataproc job."]
    },
    {
      "condition": "Region must be in the approved list.",
      "attribute_path": ["region"],
      "values": ["australia-southeast1"],
      "policy_type": "whitelist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
