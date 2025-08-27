package terraform.gcp.security.dataproc_metastore.service.scheduled_backup

import data.terraform.gcp.helpers
import data.terraform.gcp.security.dataproc_metastore.service.vars

conditions := [
  [
    {
      "situation_description": "Scheduled backups are enabled when they should be disabled by policy.",
      "remedies": ["Set scheduled_backup.enabled to false."]
    },
    {
      "condition": "Checks that scheduled backups are disabled.",
      "attribute_path": ["scheduled_backup", 0, "enabled"],
      "values": [false],
      "policy_type": "whitelist"
    }
  ]
]

# Displays a general message about policy compliance
# Use 'opa eval ... "data.terraform.gcp.security.<service>.<resource_type>.<policy_name>.message"
message := helpers.get_multi_summary(conditions, vars.variables).message

# Displays a detailed summary of each resources compliance to every condition and situation
# Useful for debugging
# Use 'opa eval ... "data.terraform.gcp.security.<service>.<resource_type>.<policy_name>.details"
details := helpers.get_multi_summary(conditions, vars.variables).details