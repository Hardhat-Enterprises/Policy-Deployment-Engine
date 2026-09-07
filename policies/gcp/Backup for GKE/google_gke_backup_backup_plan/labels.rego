package terraform.gcp.security.backup_for_gke.google_gke_backup_backup_plan.labels
import data.terraform.helpers
import data.terraform.gcp.security.backup_for_gke.google_gke_backup_backup_plan.vars

conditions := [
  [
    {
      "situation_description": "Backup Plan must have 'environment' label.",
      "remedies": ["Ensure labels.environment is set and not empty."]
    },
    {
      "condition": "Label environment must not be empty",
      "attribute_path": ["labels", "environment"],
      "values": [null, ""],
      "policy_type": "blacklist"
    }
  ],
  [
    {
      "situation_description": "Backup Plan must have 'cost-center' label.",
      "remedies": ["Ensure labels.cost-center is set and not empty."]
    },
    {
      "condition": "Label cost-center must not be empty",
      "attribute_path": ["labels", "cost-center"],
      "values": [null, ""],
      "policy_type": "blacklist"
    }
  ],
  [
    {
      "situation_description": "Backup Plan must have 'owner' label.",
      "remedies": ["Ensure labels.owner is set and not empty."]
    },
    {
      "condition": "Label owner must not be empty",
      "attribute_path": ["labels", "owner"],
      "values": [null, ""],
      "policy_type": "blacklist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details

