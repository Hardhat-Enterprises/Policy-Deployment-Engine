package terraform.gcp.security.compute_engine.google_compute_image.shielded_instance_initial_state_dbxs_content

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_image.vars

conditions := [
    [
        {
            "situation_description": "A configured Secure Boot forbidden-signature database contains an empty content entry.",
            "remedies": [
                "Provide non-empty base64-encoded content for each configured shielded_instance_initial_state.dbxs entry."
            ]
        },
        {
            "condition": "Configured Secure Boot forbidden-signature database content must not be empty.",
            "attribute_path": ["shielded_instance_initial_state", 0, "dbxs", "content"],
            "values": [""],
            "policy_type": "blacklist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details