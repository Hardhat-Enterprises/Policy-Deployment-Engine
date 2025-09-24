package terraform.gcp.security.looker.core.maintenance_window_set
import data.terraform.gcp.helpers
import data.terraform.gcp.security.looker.core.vars

conditions := [
  [
    {
      "situation_description": "Maintenance window is required but not configured",
      "remedies": [
        "Configure maintenance_window block with day_of_week and start_time",
        "Set predictable patching windows for system maintenance",
        "Example: Sunday at 2:00 AM for minimal business impact"
      ]
    },
    {
      "condition": "maintenance_window.day_of_week must be set",
      "attribute_path": ["maintenance_window", 0, "day_of_week"],
      "values": [null, ""], # Violates when missing or empty
      "policy_type": "blacklist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details