package terraform.gcp.security.access_context_manager.google_access_context_manager_access_policy.parent # Edit here 
import data.terraform.gcp.helpers
import data.terraform.gcp.security.access_context_manager.google_access_context_manager_access_policy.vars


conditions := [
  [
    {
      "situation_description": "IAM policy grants access to users or domains outside the organization.",
      "remedies": [
        "Remove members from public domains (e.g., gmail.com)",
        "Ensure only organization-managed identities are used"
      ]
    },
    {
      "condition": "Disallow public or external IAM members.",
      "attribute_path": ["policy_data", "bindings", 0, "members", 0],
      "values": [["allUsers"], ["allAuthenticatedUsers"], ["@gmail.com"]],
      "policy_type": "pattern blacklist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
