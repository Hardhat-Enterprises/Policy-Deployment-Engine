package terraform.gcp.security.backup_for_gke.backup_plan_iam_binding.domain_access
import data.terraform.helpers
import data.terraform.gcp.security.backup_for_gke.backup_plan_iam_binding.vars

conditions := [
  [
    {
      "situation_description": "Backup Plan IAM members must not correspond to personal email accounts.",
      "remedies": ["Remove members with personal email domains (@gmail.com, etc)."]
    },
    {
      "condition": "Members must not be personal emails",
      "attribute_path": ["members"],
      "values": ["@gmail.com", "@yahoo.com", "@hotmail.com", "@aol.com", "@outlook.com"],
      "policy_type": "element_blacklist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
