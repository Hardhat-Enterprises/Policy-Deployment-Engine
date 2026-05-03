package terraform.gcp.security.Cloud_IAM.google_iam_projects_policy_binding.project_principal_whitelist

import data.terraform.helpers
import data.terraform.gcp.security.Cloud_IAM.google_iam_projects_policy_binding.vars

conditions := [
  [
    {
      "situation_description": "Project policy binding must only allow approved project-level principals to reduce unauthorized access exposure",
      "remedies": [
        "Restrict bindings to approved project IDs only",
        "Remove wildcard or external project principals",
        "Ensure only enterprise-managed projects are included"
      ]
    },
    {
      "condition": "Whitelist approved project principal sets",
      "attribute_path": ["target", "principal_set"],
      "values": [
        "//cloudresourcemanager.googleapis.com/projects/approved-project-1",
        "//cloudresourcemanager.googleapis.com/projects/approved-project-2"
      ],
      "policy_type": "whitelist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details