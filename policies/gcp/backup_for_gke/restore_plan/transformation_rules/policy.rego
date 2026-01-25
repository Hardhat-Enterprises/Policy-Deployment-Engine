package terraform.gcp.security.backup_for_gke.restore_plan.transformation_rules
import data.terraform.helpers
import data.terraform.gcp.security.backup_for_gke.restore_plan.vars

conditions := [
  [
    {
      "situation_description": "Restore Plan transformation rules must be defined correctly.",
      "remedies": ["Ensure transformation rules field actions are valid."]
    },
    {
      "condition": "Transformation rules field actions must be valid",
      "attribute_path": ["restore_config", 0, "transformation_rules", 0, "field_actions", 0, "op"],
      "values": ["REMOVE", "REPLACE", "ADD"],
      "policy_type": "whitelist"
    }
  ],
  [
    {
      "situation_description": "Restore Plan transformation rules should have a description.",
      "remedies": ["Add a description to transformation rules explanation."]
    },
    {
      "condition": "Transformation rule description must not be empty",
      "attribute_path": ["restore_config", 0, "transformation_rules", 0, "description"],
      "values": ["", null],
      "policy_type": "blacklist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
