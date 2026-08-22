package terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_service_perimeter_egress_policy.egress_to_roles

import data.terraform.helpers
import data.terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_service_perimeter_egress_policy.vars

conditions := [[
    {
        "situation_description": "Ensure dry-run egress policies only allow approved IAM roles.",
        "remedies": ["Replace overly permissive egress_to.roles values with approved roles such as 'roles/bigquery.dataViewer'."]
    },
    {
        "condition": "egress_to.roles only contains approved roles",
        "attribute_path": ["egress_to", 0, "roles"],
        "values": ["roles/bigquery.dataViewer"],
        "policy_type": "whitelist"
    }
]]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
