package terraform.gcp.security.certificate_authority_service.google_privateca_ca_pool.issuance_policy_baseline_values_name_constraints_excluded_dns_names

import data.terraform.helpers
import data.terraform.helpers.shared
import data.terraform.gcp.security.certificate_authority_service.google_privateca_ca_pool.vars

conditions := [
    [
        {
            "situation_description": "CA Pool name constraints must exclude the special-use localhost DNS namespace.",
            "remedies": [
                "Add localhost to excluded_dns_names.",
                "Use DNS namespace names rather than wildcard entries in excluded_dns_names."
            ]
        },
        {
            "condition": "DNS exclusion entries must not contain wildcards",
            "attribute_path": ["issuance_policy", 0, "baseline_values", 0, "name_constraints", 0, "excluded_dns_names"],
            "values": ["*"],
            "policy_type": "element blacklist"
        }
    ]
]

missing_localhost := {
    {
        "name": shared.get_resource_attribute(resource, vars.variables.resource_value_name),
        "message": "Name constraints do not exclude the localhost DNS namespace."
    } |
    resource := input.planned_values.root_module.resources[_]
    resource.type == vars.variables.resource_type
    exclusions := object.get(
        resource.values,
        ["issuance_policy", 0, "baseline_values", 0, "name_constraints", 0, "excluded_dns_names"],
        []
    )
    count([name | some name in exclusions; lower(name) == "localhost"]) == 0
}

result := helpers.get_multi_summary(conditions, vars.variables)

missing_names := {violation.name | some violation in missing_localhost}
original_situation := result.details[0]
failing_names := original_situation.non_compliant_resources | missing_names

details := [
    object.union(original_situation, {
        "non_compliant_resources": failing_names,
        "conditions": array.concat(original_situation.conditions, [
            {"localhost must be excluded": missing_localhost}
        ])
    })
]

resource_count := count([
    resource |
    resource := input.planned_values.root_module.resources[_]
    resource.type == vars.variables.resource_type
])

message := helpers.format_summary_messages(
    vars.variables.friendly_resource_name,
    resource_count,
    details
)