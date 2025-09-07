package terraform.gcp.security.cloud_platform_service.google_project.tags

import data.terraform.gcp.helpers
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
 




# Displays a general message about policy compliance
# Use 'opa eval ... "data.terraform.gcp.security.<service>.<resource_type>.<policy_name>.message"
message := helpers.get_multi_summary(conditions, vars.variables).message

# Displays a detailed summary of each resources compliance to every condition and situation
# Useful for debugging
# Use 'opa eval ... "data.terraform.gcp.security.<service>.<resource_type>.<policy_name>.details"
details := helpers.get_multi_summary(conditions, vars.variables).details

