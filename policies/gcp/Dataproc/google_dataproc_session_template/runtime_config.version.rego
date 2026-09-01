package terraform.gcp.security.dataproc.google_dataproc_session_template.runtime_config_version

import data.terraform.helpers
import data.terraform.gcp.security.dataproc.google_dataproc_session_template.vars

conditions := [
    [
        {
            "situation_description": "Dataproc Session Template does not specify an approved runtime version.",
            "remedies": [
                "Configure an approved Dataproc runtime version."
            ]
        },
        {
            "condition": "Runtime version must be an approved version.",
            "attribute_path": ["runtime_config", 0, "version"],
            "values": ["2.2"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
