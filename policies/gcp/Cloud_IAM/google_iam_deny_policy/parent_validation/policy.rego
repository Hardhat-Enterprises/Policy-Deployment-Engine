package terraform.gcp.security.Cloud_IAM.google_iam_deny_policy.parent_validation
import data.terraform.helpers
import data.terraform.gcp.security.Cloud_IAM.google_iam_deny_policy.vars

conditions := [
  [
    {
      "situation_description": "Parent is not correctly defined",
      "remedies": ["Use format: cloudresourcemanager.googleapis.com/projects/<project_id>"]
    },
    {
      "condition": "Validate parent format",
      "attribute_path": ["parent"],
      "values": ["cloudresourcemanager.googleapis.com/projects/*"],
      "policy_type": "pattern whitelist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details