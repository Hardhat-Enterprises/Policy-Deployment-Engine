package terraform.gcp.security.cloud_platform_service.google_project.labels

import data.terraform.gcp.helpers
import data.terraform.gcp.security.cloud_platform_service.google_project.vars

conditions := [

  [
    {
      "situation_description": "Projects must have a 'team' label for ownership tracking.",
      "remedies": ["Add labels = { team = \"your-team-name\" } to the project."]
    },
    {
      "condition": "Missing team label",
      "attribute_path": ["labels","team"],
      "values":[null],
      "policy_type": "blacklist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
