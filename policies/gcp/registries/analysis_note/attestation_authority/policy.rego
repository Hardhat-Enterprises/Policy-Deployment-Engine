package terraform.gcp.security.registries.google_container_analysis_note.attestation_authority

import data.terraform.gcp.helpers
import data.terraform.gcp.security.analysis_note.attestation_authority.hint.vars


conditions := [
    [
        {"situation_description" : "The 'human_readable_name' for attestation authority is not valid.",
         "remedies": [
            "Change 'human_readable_name' to a valid value.",
            "Valid values: 'QA', 'Build'"
         ]
        },
        {
            "condition": "Test if 'human_readable_name' is one of the allowed values",
            "attribute_path" : ["attestation_authority", 0, "hint", 0, "human_readable_name"],
            "values" : ["QA", "Build"], 
            "policy_type" : "whitelist" 
        }
    ]
]


message := helpers.get_multi_summary(conditions, vars.variables).message


details := helpers.get_multi_summary(conditions, vars.variables).details
