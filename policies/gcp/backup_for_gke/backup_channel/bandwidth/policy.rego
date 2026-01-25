package terraform.gcp.security.backup_for_gke.backup_channel.bandwidth
import data.terraform.helpers
import data.terraform.gcp.security.backup_for_gke.backup_channel.bandwidth.vars

conditions := [
  [
    {
      "situation_description": "To prevent network congestion during business hours, backup channels must define a bandwidth limit.",
      "remedies": ["Add label 'bandwidth-limit' with value '50mbps'."]
    },
    {
      "condition": "Backup Channel must have bandwidth-limit label set to 50mbps",
      "attribute_path": ["labels", "bandwidth-limit"],
      "values": ["50mbps"],
      "policy_type": "whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
