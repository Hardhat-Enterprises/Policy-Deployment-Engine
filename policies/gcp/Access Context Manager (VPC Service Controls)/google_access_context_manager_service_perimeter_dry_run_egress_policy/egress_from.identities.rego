package terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_service_perimeter_dry_run_egress_policy.egress_from_identities

import data.terraform.helpers
import data.terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_service_perimeter_dry_run_egress_policy.vars

conditions := [[
    {
        "situation_description": "Ensure dry-run egress policies only allow approved source identities.",
        "remedies": ["Replace unapproved egress_from.identities values with approved identities such as 'serviceAccount:approved-sa@my-project.iam.gserviceaccount.com'."]
    },
    {
        "condition": "egress_from.identities only contains approved identities",
        "attribute_path": ["egress_from", 0, "identities"],
        "values": ["serviceAccount:approved-sa@my-project.iam.gserviceaccount.com"],
        "policy_type": "whitelist"
    }
]]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
