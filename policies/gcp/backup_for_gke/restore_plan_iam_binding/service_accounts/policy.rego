package terraform.gcp.security.backup_for_gke.restore_plan_iam_binding.service_accounts
import data.terraform.helpers
import data.terraform.gcp.security.backup_for_gke.restore_plan_iam_binding.vars

conditions := [
  [
    {
      "situation_description": "Service accounts must not include deleted accounts.",
      "remedies": ["Remove members with 'deleted:' prefix."]
    },
    {
      "condition": "Service accounts must not include deleted accounts",
      "attribute_path": ["members"],
      "values": ["deleted:"],
      "policy_type": "element_blacklist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
