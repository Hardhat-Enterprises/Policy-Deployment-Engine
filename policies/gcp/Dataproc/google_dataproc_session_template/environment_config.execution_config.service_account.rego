package terraform.gcp.security.dataproc.google_dataproc_session_template.environment_config_execution_config_service_account

import data.terraform.helpers
import data.terraform.gcp.security.dataproc.google_dataproc_session_template.vars

conditions := [
    [
        {
            "situation_description": "Dataproc Session Template runs as a default Google-managed identity rather than a dedicated least-privilege service account.",
            "remedies": [
                "Set service_account to a dedicated project-managed service account of the form <name>@<project>.iam.gserviceaccount.com."
            ]
        },
        {
            "condition": "A dedicated service account must be configured.",
            "attribute_path": ["environment_config", 0, "execution_config", 0, "service_account"],
            "values": [null, ""],
            "policy_type": "blacklist"
        },
        {
            "condition": "Default Google-managed service accounts must not be used.",
            "attribute_path": ["environment_config", 0, "execution_config", 0, "service_account"],
            "values": [
                "@*",
                [["developer.gserviceaccount.com", "compute.gserviceaccount.com", "appspot.gserviceaccount.com"]]
            ],
            "policy_type": "pattern blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
