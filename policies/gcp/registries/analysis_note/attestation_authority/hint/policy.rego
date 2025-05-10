package terraform.gcp.security.registries.google_container_analysis_note.attestation_authority

import data.terraform.gcp.helpers
import data.terraform.gcp.security.analysis_note.attestation_authority.hint.vars

# Conditions to check the 'human_readable_name' attribute
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
            "values" : ["QA", "Build"], # Allow these values
            "policy_type" : "whitelist"  # Only these values are allowed
        }
    ]
]

# Display a general message about policy compliance
# Use 'opa eval ... "data.terraform.gcp.security.container_registries.google_container_analysis_note.attestation_authority_policy.message"'
message := helpers.get_multi_summary(conditions, vars.variables).message

# Display a detailed summary of each resource's compliance to every condition and situation
# Useful for debugging
# Use 'opa eval ... "data.terraform.gcp.security.container_registries.google_container_analysis_note.attestation_authority_policy.details"'
details := helpers.get_multi_summary(conditions, vars.variables).details
