package terraform.gcp.security.backup_for_gke.restore_plan_iam.service_accounts

import rego.v1
import data.terraform.gcp.security.backup_for_gke.restore_plan_iam.vars
import data.terraform.helpers.policies.pattern_whitelist

# Only allow project service accounts
violations := pattern_whitelist.get_violations(
    vars.variables,
    ["members"],
    ["serviceAccount:*@fluent-coder-468700-h4.iam.gserviceaccount.com", [[]]]
)

message := [m | 
    some violation in violations
    m := violation.message
]