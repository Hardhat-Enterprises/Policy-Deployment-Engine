package terraform.gcp.security.cloud_ids.google_cloud_ids_endpoint.network

import data.terraform.helpers
import data.terraform.gcp.security.cloud_ids.google_cloud_ids_endpoint.vars

conditions := [
  [
    {
      "situation_description": "IDS endpoint is using an insecure default or public network",
      "remedies": ["Use a private VPC network instead of default or public networks"]
    },
    {
      "condition": "Default or public network detected",
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