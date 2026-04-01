package terraform.gcp.security.backup_for_gke.restore_plan_iam_binding.cross_project_groups
import data.terraform.helpers
import data.terraform.gcp.security.backup_for_gke.restore_plan_iam_binding.vars

conditions := [
  [
    {
      "situation_description": "Restore Plan IAM members must not contain cross-project groups.",
      "remedies": ["Remove cross-project groups (ext-, external-, partner-)."]
    },
    {
      "condition": "Members must not be cross-project groups",
      "attribute_path": ["members"],
      "values": ["@ext-", "@external-", "@partner-"],
      "policy_type": "element_blacklist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
