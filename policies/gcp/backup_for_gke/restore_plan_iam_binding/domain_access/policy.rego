package terraform.gcp.security.backup_for_gke.restore_plan_iam_binding.domain_access
import data.terraform.helpers
import data.terraform.gcp.security.backup_for_gke.restore_plan_iam_binding.vars

conditions := [
  [
    {
      "situation_description": "Restore operations must be restricted to corporate accounts.",
      "remedies": ["Remove members with @gmail.com, @hotmail.com, etc."]
    },
    {
      "condition": "Members must not be personal emails",
      "attribute_path": ["members"],
      "values": ["@gmail.com", "@yahoo.com", "@hotmail.com", "@outlook.com", "@live.com"],
      "policy_type": "element_blacklist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
