package terraform.gcp.security.dataform.google_dataform_repository.region_allowlist

import data.terraform.gcp.helpers
import data.terraform.gcp.security.dataform.google_dataform_repository as repo

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

message := helpers.get_multi_summary(conditions, repo.variables).message
details := helpers.get_multi_summary(conditions, repo.variables).details