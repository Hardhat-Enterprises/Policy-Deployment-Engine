package terraform.gcp.security.backup_for_gke.backup_plan_iam_binding.federated_identities
import data.terraform.helpers
import data.terraform.gcp.security.backup_for_gke.backup_plan_iam_binding.vars

conditions := [
  [
    {
      "situation_description": "Backup Plan IAM members must not be federated identities.",
      "remedies": ["Remove federated identities."]
    },
    {
      "condition": "Members should not include federated identities",
      "attribute_path": ["members"],
      "values": ["principal://iam.googleapis.com/*", "principalSet://iam.googleapis.com/*"],
      "policy_type": "whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
