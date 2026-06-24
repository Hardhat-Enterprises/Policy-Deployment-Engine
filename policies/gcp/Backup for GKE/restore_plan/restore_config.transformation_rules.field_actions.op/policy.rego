package terraform.gcp.security.backup_for_gke.restore_plan.restore_config_transformation_rules_field_actions_op

import data.terraform.helpers
import data.terraform.gcp.security.backup_for_gke.restore_plan.vars

# Merged policy for `restore_config.transformation_rules.field_actions.op` — 2 independent scenarios, each a
# situation in `conditions`, evaluated separately by helpers.get_multi_summary.
conditions := [
[
    {
      "situation_description": "Restore Plan transformation rule field action op must be valid.",
      "remedies": ["Set op to REMOVE, REPLACE, or ADD."]
    },
    {
      "condition": "Field action op must be REMOVE, REPLACE, or ADD",
      "attribute_path": ["restore_config", 0, "transformation_rules", 0, "field_actions", 0, "op"],
      "values": ["REMOVE", "REPLACE", "ADD"],
      "policy_type": "whitelist"
    }
  ],
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

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
