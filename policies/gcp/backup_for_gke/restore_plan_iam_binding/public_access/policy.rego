package terraform.gcp.security.backup_for_gke.restore_plan_iam_binding.public_access
import data.terraform.helpers
import data.terraform.gcp.security.backup_for_gke.restore_plan_iam_binding.vars

conditions := [
  [
    {
      "situation_description": "Restore Plan IAM must strictly prohibit public access to prevent unauthorized data restoration.",
      "remedies": ["Remove 'allUsers' and 'allAuthenticatedUsers' from IAM bindings."]
    },
    {
      "condition": "Public access forbidden",
      "attribute_path": ["members"],
      "values": ["allUsers", "allAuthenticatedUsers"],
      "policy_type": "element_blacklist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
