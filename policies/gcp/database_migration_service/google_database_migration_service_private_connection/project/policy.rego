package terraform.gcp.security.dms.private_connection.project

import data.terraform.gcp.helpers
import data.terraform.gcp.security.dms.private_connection.vars

# Check if project is missing entirely
project_missing_or_empty(r) if {
  not r.values.project
}

# Check if project is explicitly empty
project_missing_or_empty(r) if {
  r.values.project == ""
}

# Custom function combining both checks
missing_project(r) = true if {
  r.type == "google_database_migration_service_private_connection"
  project_missing_or_empty(r)
}

# Standard helper-based condition summary
conditions := [
  [
    {
      "situation_description": "Project ID is not explicitly specified. This can lead to misconfigured deployments.",
      "remedies": ["Specify the 'project' attribute explicitly."]
    },
    {
      "condition": "Missing or null project",
      "attribute_path": ["project"],
      "values": ["", null],
      "policy_type": "blacklist"
    }
  ]
]

non_compliant_resources := [r.name |
  r := input.planned_values.root_module.resources[_]
  missing_project(r)
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
