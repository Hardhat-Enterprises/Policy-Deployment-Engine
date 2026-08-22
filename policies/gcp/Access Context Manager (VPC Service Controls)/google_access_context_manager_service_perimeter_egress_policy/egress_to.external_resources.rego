package terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_service_perimeter_egress_policy.egress_to_external_resources

import data.terraform.helpers
import data.terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_service_perimeter_egress_policy.vars

conditions := [[
    {
        "situation_description": "Ensure service perimeter egress policies only allow approved external resources.",
        "remedies": ["Replace unapproved egress_to.external_resources values with approved external resource URIs such as 's3://approved-bucket/path'."]
    },
    {
        "condition": "egress_to.external_resources only contains approved external resources",
        "attribute_path": ["egress_to", 0, "external_resources"],
        "values": ["s3://approved-bucket/path"],
        "policy_type": "whitelist"
    }
]]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
