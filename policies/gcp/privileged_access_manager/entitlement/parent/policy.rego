package terraform.gcp.security.privileged_access_manager.entitlement.parent
import data.terraform.gcp.helpers
import data.terraform.gcp.security.privileged_access_manager.entitlement.vars

conditions := [
  [
    {
      "situation_description": "Parent field must follow the correct GCP format",
      "remedies": ["Use projects/{project-id|project-number}, folders/{folder-number}, or organizations/{organization-number}"]
    },
    {
      "condition": "Check if parent matches allowed GCP resource patterns",
      "attribute_path": ["parent"],
      "values": ["^projects/[a-z0-9\\-]+$", "^folders/[0-9]+$", "^organizations/[0-9]+$"],
      "policy_type": "pattern whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
