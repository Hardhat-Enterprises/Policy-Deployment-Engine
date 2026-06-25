package terraform.gcp.security.database_migration_service.google_database_migration_service_connection_profile.oracle_forward_ssh_connectivity_hostname
import data.terraform.helpers
import data.terraform.gcp.security.database_migration_service.google_database_migration_service_connection_profile.vars

conditions := [
  [
    {
      "situation_description": "Disallow Oracle forward SSH connectivity (use private_connectivity instead).",
      "remedies": ["Remove forward_ssh_connectivity block and configure private_connectivity."]
    },
    {
      "condition": "forward_ssh_connectivity must be unset",
      "attribute_path": ["oracle", 0, "forward_ssh_connectivity", 0, "hostname"],
      "values": [null],   # Allow empty array only
      "policy_type": "whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details