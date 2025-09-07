package terraform.gcp.security.cloud_platform_service.google_project.project_id

import data.terraform.gcp.helpers
import data.terraform.gcp.security.cloud_platform_service.google_project.vars


conditions := [
    [
    {"situation_description": "Project ID must follow org convention: proj-{team}-{env}.",
      "remedies": ["Rename project_id to match proj-{team}-{env} (team: app|sec|ops, env: dev|test|prod)."]},
     {
    "condition": "Invalid project_id pattern",
    "attribute_path": ["project_id"],
    "values": ["*-*-*", [["proj"], ["app","sec","ops"], ["dev","test","prod"]]],
    "policy_type": "pattern whitelist"
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

