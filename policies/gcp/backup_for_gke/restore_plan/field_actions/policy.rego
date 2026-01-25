package terraform.gcp.security.backup_for_gke.restore_plan.field_actions
import data.terraform.helpers
import data.terraform.gcp.security.backup_for_gke.restore_plan.vars

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
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
