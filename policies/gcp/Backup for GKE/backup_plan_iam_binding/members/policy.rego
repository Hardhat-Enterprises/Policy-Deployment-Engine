package terraform.gcp.security.backup_for_gke.backup_plan_iam_binding.members
import data.terraform.helpers
import data.terraform.gcp.security.backup_for_gke.backup_plan_iam_binding.vars

conditions := [
  [
    {
      "situation_description": "Backup Plan IAM members must not contain public or personal access.",
      "remedies": ["Remove allUsers, allAuthenticatedUsers, and personal emails."]
    },
    {
      "condition": "Members must not include public/personal access",
      "attribute_path": ["members"],
      "values": ["@gmail.com", "@hotmail.com", "@yahoo.com", "allUsers", "allAuthenticatedUsers"],
      "policy_type": "element_blacklist"
    }
  ],
  [
    {
      "situation_description": "Backup Plan IAM members must not contain deleted accounts.",
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
