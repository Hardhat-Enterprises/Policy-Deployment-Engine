package terraform.gcp.security.vertex_ai_workbench.google_workbench_instance.idle_timeout_seconds

import data.terraform.helpers
import data.terraform.gcp.security.vertex_ai_workbench.google_workbench_instance.vars

conditions := [
  [
    {
      "situation_description": "Ensure an idle timeout is configured. Without it, abandoned instances run indefinitely, increasing cost and attack surface.",
      "remedies": ["Set gce_setup.metadata[\"idle-timeout-seconds\"] to a value (e.g. \"3600\" for 1 hour)."]
    },
    {
      "condition": "idle-timeout-seconds is not set",
      "attribute_path": ["gce_setup", 0, "metadata", "idle-timeout-seconds"],
      "values": null,
      "policy_type": "blacklist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
