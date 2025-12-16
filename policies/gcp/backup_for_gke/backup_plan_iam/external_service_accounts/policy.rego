package terraform.gcp.security.backup_for_gke.backup_plan_iam.external_service_accounts

import rego.v1
import data.terraform.gcp.security.backup_for_gke.backup_plan_iam.vars
import data.terraform.helpers.policies.element_blacklist

# Prevent external service accounts
violations := element_blacklist.get_violations(
    vars.variables,
    ["members"],
    ["serviceAccount:*@*.iam.gserviceaccount.com"]
)

message := [m | 
    some violation in violations
    m := violation.message
]