package terraform.gcp.security.cloud_platform_service.google_project.tags

import data.terraform.helpers
import data.terraform.gcp.security.cloud_platform_service.google_project.vars

# Require env tag with an approved value
conditions := [
  [
    {
      "situation_description": "Project must include environment tag: tagKeys/env with value dev/test/prod.",
      "remedies": ["Add tags = {\"tagKeys/env\" = \"tagValues/dev|test|prod\"} on the project."]
    },
    {
      "condition": "Missing or invalid env tag",
      "attribute_path": ["tags", "tagKeys/env"],
      "values": ["tagValues/dev", "tagValues/test", "tagValues/prod"],
      "policy_type": "whitelist"
    }
  ]
]
 
result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details

