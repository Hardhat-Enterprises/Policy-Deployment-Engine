package terraform.gcp.security.certificate_authority_service.google_privateca_certificate_template.predefined_values_name_constraints_critical

import data.terraform.helpers
import data.terraform.gcp.security.certificate_authority_service.google_privateca_certificate_template.vars

conditions := [
    [
        {
            "situation_description": "Template name constraints must be marked critical so certificate scope restrictions cannot be silently ignored.",
            "remedies": [
                "Set predefined_values.name_constraints.critical to true.",
                "Critical name constraints require clients to reject certificates when they cannot process the restrictions."
            ]
        },
        {
            "condition": "name constraints critical flag is in approved whitelist",
            "attribute_path": ["predefined_values", 0, "name_constraints", 0, "critical"],
            "values": [true],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details