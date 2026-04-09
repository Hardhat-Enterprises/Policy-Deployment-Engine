package terraform.gcp.security.dataform.google_dataform_repository.region_allowlist

import data.terraform.helpers
import data.terraform.gcp.security.dataform.google_dataform_repository.vars

# Adjust the allowlist as needed
approved_regions := ["australia-southeast1"]

conditions := [
  [
    {
      "situation_description": "Repository region must be in the approved allowlist",
      "remedies": [
        sprintf("Set region to one of: %v", [approved_regions])
      ]
    },
    {
      "condition": "Region allowlist",
      "attribute_path": ["region"],
      "policy_type": "whitelist",
      "values": approved_regions
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details