package terraform.gcp.security.backup_for_gke.backup_channel.labels
import data.terraform.helpers
import data.terraform.gcp.security.backup_for_gke.backup_channel.vars

conditions := [
  [
    {
      "situation_description": "GKE Backup Channel must have a valid environment label.",
      "remedies": ["Set labels.environment to one of: prod, staging, dev."]
    },
    {
      "condition": "Label environment must be one of: prod, staging, dev",
      "attribute_path": ["labels", "environment"],
      "values": ["prod", "staging", "dev"],
      "policy_type": "whitelist"
    }
  ],
  [
    {
      "situation_description": "GKE Backup Channel must have ownership labels.",
      "remedies": ["Ensure 'owner' and 'cost-center' labels are present."]
    },
    {
      "condition": "Must have owner label",
      "attribute_path": ["labels", "owner"],
      "values": ["^.+$"],
      "policy_type": "pattern_whitelist"
    },
    {
      "condition": "Must have cost-center label",
      "attribute_path": ["labels", "cost-center"],
      "values": ["^.+$"],
      "policy_type": "pattern_whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
