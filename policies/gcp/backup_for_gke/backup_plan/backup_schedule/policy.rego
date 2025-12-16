package terraform.gcp.security.backup_for_gke.backup_plan.backup_schedule

import rego.v1
import data.terraform.gcp.security.backup_for_gke.backup_plan.vars
import data.terraform.helpers.policies.whitelist

# Backup schedule must be defined
violations := whitelist.get_violations(
    vars.variables,
    ["backup_schedule", 0, "cron_schedule"],
    ["0 2 * * *", "0 3 * * *", "0 4 * * *"]  # Daily backups at 2, 3, or 4 AM
)

message := [m | 
    some violation in violations
    m := violation.message
]