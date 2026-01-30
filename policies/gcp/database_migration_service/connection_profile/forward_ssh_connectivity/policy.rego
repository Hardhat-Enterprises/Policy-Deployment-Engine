package terraform.gcp.security.database_migration_service.connection_profile.forward_ssh_connectivity
import data.terraform.helpers
import data.terraform.gcp.security.database_migration_service.connection_profile.vars

conditions := [
  [
    {
      "situation_description": "Disallow Oracle forward SSH connectivity (use private_connectivity instead).",
      "remedies": ["Remove forward_ssh_connectivity block and configure private_connectivity."]
    },
    {
      "condition": "forward_ssh_connectivity must be unset",
      "attribute_path": ["oracle",0,"forward_ssh_connectivity"],
      "values": [[]],   # Allow empty array only
      "policy_type": "whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details