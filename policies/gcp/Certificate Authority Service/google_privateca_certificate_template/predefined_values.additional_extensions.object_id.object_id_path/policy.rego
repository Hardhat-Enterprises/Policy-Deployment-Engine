package terraform.gcp.security.certificate_authority_service.google_privateca_certificate_template.predefined_values_additional_extensions_object_id_object_id_path

import data.terraform.helpers
import data.terraform.gcp.security.certificate_authority_service.google_privateca_certificate_template.vars

conditions := [
    [
        {
            "situation_description": "Additional certificate extensions must use an approved object identifier.",
            "remedies": [
                "Set the additional extension object_id_path to an approved OID.",
                "Restricting OIDs prevents unauthorized or security-sensitive extensions from being included in issued certificates."
            ]
        },
        {
            "condition": "additional extension OID is in approved whitelist",
            "attribute_path": ["predefined_values", 0, "additional_extensions", 0, "object_id", 0, "object_id_path"],
            "values": [1, 3, 6, 4, 11129, 2, 5],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details