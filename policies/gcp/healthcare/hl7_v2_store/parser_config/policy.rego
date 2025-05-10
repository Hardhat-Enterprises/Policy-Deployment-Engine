package terraform.gcp.security.healthcare.hl7_v2_store.parser_config

import data.terraform.gcp.helpers
import data.terraform.gcp.security.healthcare.hl7_v2_store.vars

scenarios_list := [
    [
        {
            "situation_description": "Non-compliant parser configuration: 'allow_null_header' set to true or unsupported segment terminator or version.",
            "remedies": [
                "Set 'allow_null_header' to false to enforce structured headers.",
                "Use standard segment terminator (e.g., '\\r', base64encoded as 'DQ==').",
                "Use only supported versions like 'V1'."
            ]
        },
        {
            "condition": "non-compliant parser_config settings",
            "attribute_path": ["parser_config.allow_null_header", "parser_config.segment_terminator", "parser_config.version"],
            "values": [true, "Cg==", "V3"],
            "policy_type": "blacklist"
        }
    ]
]

variables := {
    "resource_type": "google_healthcare_hl7_v2_store",
    "friendly_resource_name": "Google Cloud Healthcare HL7v2 Store",
    "resource_value_name": "parser_config"
}

summary := helpers.get_multi_summary(scenarios_list, variables)

message := summary.message
detail := summary.details
