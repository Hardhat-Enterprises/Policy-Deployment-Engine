package terraform.gcp.security.Cloud_IAM.google_iam_access_boundary_policy.parent_validation

import data.terraform.helpers
import data.terraform.gcp.security.Cloud_IAM.google_iam_access_boundary_policy.vars

conditions := [
  [
    {
      "situation_description": "Parent must be a valid Cloud Resource Manager project path (URL encoding allowed)",
      "remedies": [
        "Use the correct format: cloudresourcemanager.googleapis.com/projects/<project_id>",
        "Project ID must be 6–30 characters, lowercase letters, digits, and hyphens only",
        "Must start with a letter and not end with a hyphen",
        "If using urlencode(), ensure the decoded value matches the required format"
      ]
    },
    {
      "condition": "Validate parent format against CRM project path pattern",
      "attribute_path": ["parent"],
      "values": [
        "^cloudresourcemanager\\.googleapis\\.com/projects/[a-z][a-z0-9\\-]{4,28}[a-z0-9]$"
      ],
      "policy_type": "pattern whitelist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details