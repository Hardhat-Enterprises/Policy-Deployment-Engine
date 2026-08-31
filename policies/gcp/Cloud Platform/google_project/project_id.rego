package terraform.gcp.security.cloud_platform_service.google_project.project_id

import data.terraform.helpers
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
 

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details

