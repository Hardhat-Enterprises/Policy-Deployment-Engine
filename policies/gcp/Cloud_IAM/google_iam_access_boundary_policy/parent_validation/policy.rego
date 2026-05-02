package terraform.gcp.security.Cloud_IAM.google_iam_access_boundary_policy.parent_validation

import data.terraform.helpers
import data.terraform.gcp.security.Cloud_IAM.google_iam_access_boundary_policy.vars

conditions := [
  [
    {
      "situation_description": "Parent must be a valid Cloud Resource Manager project path (URL encoded allowed)",
      "remedies": [
        "Use correct format: cloudresourcemanager.googleapis.com/projects/<project_id>",
        "Ensure value is URL encoded if using urlencode()"
      ]
    },
    {
      "condition": "Validate parent format",
      "attribute_path": ["parent"],
      "values": [
        "^cloudresourcemanager\\.googleapis\\.com/projects/.+"
      ],
      "policy_type": "pattern whitelist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details