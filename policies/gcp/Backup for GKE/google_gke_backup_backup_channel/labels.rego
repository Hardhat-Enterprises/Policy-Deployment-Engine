package terraform.gcp.security.backup_for_gke.google_gke_backup_backup_channel.labels
import data.terraform.helpers
import data.terraform.gcp.security.backup_for_gke.google_gke_backup_backup_channel.vars

# 'owner', 'cost-center' and 'bandwidth-limit' are checked for PRESENCE only, by
# blacklisting the empty values. The docs rationale for `labels` makes presence the
# control ("required for cost allocation and ownership tracking") and states no shape
# for the values, so there is no pattern to pair the check with. This is the same
# idiom google_gke_backup_backup_plan/labels.rego uses for the same labels.
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
      "values": [null, ""],
      "policy_type": "blacklist"
    },
    {
      "condition": "Must have cost-center label",
      "attribute_path": ["labels", "cost-center"],
      "values": [null, ""],
      "policy_type": "blacklist"
    }
  ],
  [
    {
      "situation_description": "To prevent network congestion during business hours, backup channels must define a bandwidth limit.",
      "remedies": ["Add label 'bandwidth-limit' with a value."]
    },
    {
      "condition": "Must have bandwidth-limit label",
      "attribute_path": ["labels", "bandwidth-limit"],
      "values": [null, ""],
      "policy_type": "blacklist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
