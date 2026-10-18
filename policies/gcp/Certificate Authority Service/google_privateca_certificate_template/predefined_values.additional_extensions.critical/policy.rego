package terraform.gcp.security.certificate_authority_service.google_privateca_certificate_template.predefined_values_additional_extensions_critical

import data.terraform.helpers
import data.terraform.gcp.security.certificate_authority_service.google_privateca_certificate_template.vars

conditions := [
    [
        {
            "situation_description": "Additional certificate extensions must be marked critical so unsupported security semantics are not silently ignored.",
            "remedies": [
                "Set predefined_values.additional_extensions.critical to true.",
                "Critical extensions require clients to reject certificates when they cannot process the extension."
            ]
        },
        {
            "condition": "additional extension critical flag is in approved whitelist",
            "attribute_path": ["predefined_values", 0, "additional_extensions", 0, "critical"],
            "values": [true],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details