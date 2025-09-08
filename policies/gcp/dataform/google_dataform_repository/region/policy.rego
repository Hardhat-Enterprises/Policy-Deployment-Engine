package terraform.gcp.security.dataform.google_dataform_repository.region
import data.terraform.gcp.helpers
import data.terraform.gcp.security.dataform.google_dataform_repository.vars

conditions := [
  [
    {
      "situation_description": "Repository must be deployed only in approved regions.",
      "remedies": ["Use only approved regions: australia-southeast1"]
    },
    {
      "condition": "Region must be in allow-list",
      "attribute_path": ["region"],
      "values": ["australia-southeast1"],
      "policy_type": "whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
