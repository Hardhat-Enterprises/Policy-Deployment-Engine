package terraform.gcp.security.cloud_healthcare.google_healthcare_pipeline_job.disable_lineage

import data.terraform.helpers
import data.terraform.gcp.security.cloud_healthcare.google_healthcare_pipeline_job.vars

conditions := [
  [
    {
      "situation_description": "Healthcare Pipeline Job has lineage tracking disabled — data provenance cannot be audited",
      "remedies": [
        "Set disable_lineage to false",
        "This ensures lineage tracking is enabled, maintaining data provenance for audit and compliance"
      ]
    },
    {
      "condition":      "Check if disable_lineage is false",
      "attribute_path": ["disable_lineage"],
      "values":         [false],
      "policy_type":    "whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details
