package terraform.gcp.security.dataplex.google_dataplex_datascan.execution_identity_service_account_email

import data.terraform.gcp.security.dataplex.google_dataplex_datascan.vars
import data.terraform.helpers

conditions := [
        [
                {
                        "situation_description": "The Dataplex DataScan does not use an explicit non-default service account.",
                        "remedies": [
                                "Set execution_identity.service_account.email to a non-default service account.",
                        ],
                },
                {
                        "condition": "A service account email must be explicitly configured.",
                        "attribute_path": ["execution_identity", 0, "service_account", 0, "email"],
                        "values": [null, ""],
                        "policy_type": "blacklist",
                },
        ],
]

default_compute_service_account_pattern := `^[0-9]+-compute@developer\.gserviceaccount\.com$`

invalid_service_account(value) if {
        not is_string(value)
}

invalid_service_account(value) if {
        is_string(value)
        value == ""
}

invalid_service_account(value) if {
        is_string(value)
        regex.match(default_compute_service_account_pattern, value)
}

violations := [
{
        "name": resource_name,
        "message": sprintf(
                "Dataplex DataScan '%s' must use an explicit non-default service account.",
                [resource_name],
        ),
} |
        resource := input.planned_values.root_module.resources[_]
        resource.type == vars.variables.resource_type
        value := object.get(resource.values, ["execution_identity", 0, "service_account", 0, "email"], null)
        invalid_service_account(value)
        resource_name := object.get(resource.values, vars.variables.resource_value_name, resource.name)
]

non_compliant_resource_names := {
        violation.name |
        some violation in violations
}

resource_count := count([
resource |
        resource := input.planned_values.root_module.resources[_]
        resource.type == vars.variables.resource_type
])

situation_results := [
        {
                "situation": "The Dataplex DataScan does not use an explicit non-default service account.",
                "remedies": [
                        "Set execution_identity.service_account.email to a non-default service account and do not use the default Compute Engine service account.",
                ],
                "non_compliant_resources": non_compliant_resource_names,
                "conditions": [
                        {
                                "Service account must be explicit and must not use the default Compute Engine service account": violations,
                        },
                ],
        },
]

message := helpers.format_summary_messages(
        vars.variables.friendly_resource_name,
        resource_count,
        situation_results,
)

details := situation_results
