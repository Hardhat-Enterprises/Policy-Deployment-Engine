package terraform.gcp.security.backup_for_gke.restore_plan_iam_binding.member_count
import data.terraform.helpers
import data.terraform.gcp.security.backup_for_gke.restore_plan_iam_binding.vars

conditions := [
  [
    {
      "situation_description": "Member count check requires valid accounts.",
      "remedies": ["Remove members with 'deleted:' prefix."]
    },
    {
      "condition": "Members must not include deleted accounts",
      "attribute_path": ["members"],
      "values": ["deleted:"],
      "policy_type": "element_blacklist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
