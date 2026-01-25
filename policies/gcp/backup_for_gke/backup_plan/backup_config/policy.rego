package terraform.gcp.security.backup_for_gke.backup_plan.backup_config
import data.terraform.helpers
import data.terraform.gcp.security.backup_for_gke.backup_plan.vars

conditions := [
  [
    {
      "situation_description": "Backup Plan must have a defined backup_config.",
      "remedies": ["Define backup_config block."]
    },
    {
      "condition": "Backup config must not be empty or null",
      "attribute_path": ["backup_config"],
      "values": [[], null],
      "policy_type": "blacklist"
    }
  ],
  [
    {
      "situation_description": "Backup Plan must explicitly handle volume data.",
      "remedies": ["Set include_volume_data to true or false (do not leave undefined)."]
    },
    {
      "condition": "include_volume_data must be defined",
      "attribute_path": ["backup_config", 0, "include_volume_data"],
      "values": [true, false],
      "policy_type": "whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
