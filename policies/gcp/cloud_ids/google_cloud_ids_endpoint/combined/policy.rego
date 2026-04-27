package terraform.gcp.security.cloud_ids.google_cloud_ids_endpoint.combined

import data.terraform.helpers
import data.terraform.gcp.security.cloud_ids.google_cloud_ids_endpoint.vars

conditions := [
  [
    {
      "situation_description": "IDS endpoint is weakly configured with low severity and insecure network",
      "remedies": ["Use HIGH/CRITICAL severity and private VPC network"]
    },
    {
      "condition": "Weak severity detected",
      "attribute_path": ["severity"],
      "values": ["LOW", "MEDIUM", "INFORMATIONAL"],
      "policy_type": "blacklist"
    },
    {
      "condition": "Default network detected",
      "attribute_path": ["network"],
      "values": [
        "projects/*/global/networks/*",
        [[], ["default", "public"]]
      ],
      "policy_type": "pattern blacklist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details